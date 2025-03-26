import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/home_view_model.dart';
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
      body: SingleChildScrollView(
        child: ListenableBuilder(
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
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * .3,
                          maxWidth: MediaQuery.of(context).size.width - 16,
                        ),
                        child: CarouselView(
                          itemExtent: MediaQuery.of(context).size.height * .4,
                          elevation: 5,
                          children:
                              viewModel.characters
                                  .map(
                                    (e) => ImageWidget(url: e.thumbnail.path),
                                  )
                                  .toList(),
                        ),
                      ),
                    ],
                  ),
                );
          },
        ),
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
