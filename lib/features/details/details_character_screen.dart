import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

class DetailsCharacterScreen extends StatelessWidget {
  const DetailsCharacterScreen({super.key, required this.character});
  final CharacterModel character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(detalhesPersonagemString)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .01,
              ),
              child: ImageWidget(url: character.thumbnail.path),
            ),

            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .01,
              ),
              child: Text(character.name),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .01,
              ),
              child: Text(character.name),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(voltarString),
            ),
          ],
        ),
      ),
    );
  }
}
