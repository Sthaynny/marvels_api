import 'package:flutter/material.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

class CarrouselCharactersWidget extends StatelessWidget {
  const CarrouselCharactersWidget({super.key, required this.characters});
  final List<CharacterModel> characters;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .3,
        maxWidth: MediaQuery.of(context).size.width - 16,
      ),
      child: CarouselView(
        itemExtent: MediaQuery.of(context).size.height * .4,
        elevation: 5,
        children:
            characters.map((e) => ImageWidget(url: e.thumbnail.path)).toList(),
      ),
    );
  }
}
