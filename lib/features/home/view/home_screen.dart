import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/core/utils/text/scale_size.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
import 'package:marvels_api/features/home/view/widgets/carrousel_characters_widget.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';

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
                child: Column(
                  children: [
                    CarrouselCharactersWidget(characters: viewModel.characters),
                    ...viewModel.characters.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Card(
                          child: ListTile(
                            title: Text(
                              e.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context),
                              ),
                            ),
                            subtitle: Text(
                              e.description,
                              style: TextStyle(fontSize: 14),
                              textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context),
                              ),
                            ),
                            leading: ImageWidget(
                              url: e.thumbnail.path,
                              height: MediaQuery.of(context).size.width * .2,
                            ),
                          ),
                        ),
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
