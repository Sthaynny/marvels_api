import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/core/utils/text/scale_size.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Text(
                character.name,
                style: TextStyle(fontSize: 38),

                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(
                  ScaleSize.textScaleFactor(context),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .01,
              ),
              child: Text(
                character.description,
                style: TextStyle(fontSize: 14),
                textScaler: TextScaler.linear(
                  ScaleSize.textScaleFactor(context),
                ),
              ),
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
