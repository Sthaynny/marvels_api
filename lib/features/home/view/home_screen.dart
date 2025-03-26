import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/home/view/widgets/card_character_widget.dart';
import 'package:marvels_api/features/home/view/widgets/carrousel_characters_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    viewModel.getCharacters.execute();
    viewModel.getCharacters.addListener(_onResult);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.getCharacters.removeListener(_onResult);
    viewModel.getCharacters.addListener(_onResult);
  }

  @override
  void dispose() {
    viewModel.getCharacters.removeListener(_onResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomeAppString)),
      body: ListenableBuilder(
        listenable: viewModel.getCharacters,
        builder: (context, child) {
          if (viewModel.isError) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  viewModel.getCharacters.execute();
                },
                child: Text(recarregarString),
              ),
            );
          }
          return viewModel.getCharacters.running
              ? Center(child: const CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CarrouselCharactersWidget(characters: viewModel.characters),
                    ...viewModel.characters
                        .getRange(5, viewModel.characters.length - 1)
                        .map(
                          (character) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * .005,
                            ),
                            child: CardCharacterWidget(character: character),
                          ),
                        ),
                  ],
                ),
              );
        },
      ),
    );
  }

  void _onResult() {
    if (viewModel.getCharacters.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            erroAoCarregarPersonagensString,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
