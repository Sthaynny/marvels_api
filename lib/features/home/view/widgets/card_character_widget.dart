import 'package:flutter/material.dart';
import 'package:marvels_api/core/routes/app_router.dart';
import 'package:marvels_api/core/utils/text/scale_size.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

class CardCharacterWidget extends StatelessWidget {
  const CardCharacterWidget({super.key, required this.character});
  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).pushNamed(AppRouters.detailsPerson.path, arguments: character);
        },
        title: Text(
          character.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        subtitle: Text(
          character.description,
          style: TextStyle(fontSize: 14),

          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        leading: ImageWidget(
          url: character.thumbnail.path,
          size: MediaQuery.of(context).size.width * .2,
        ),
      ),
    );
  }
}
