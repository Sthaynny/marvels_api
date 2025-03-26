import 'package:flutter/material.dart';
import 'package:marvels_api/core/utils/text/scale_size.dart';
import 'package:marvels_api/features/home/view/widgets/image_widget.dart';
import 'package:marvels_api/features/shared/characters/domain/models/character_model.dart';

class CarrouselCharactersWidget extends StatelessWidget {
  const CarrouselCharactersWidget({super.key, required this.characters});
  final List<CharacterModel> characters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * .01,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .3,
          maxWidth: MediaQuery.of(context).size.width - 16,
        ),
        child: CarouselView(
          itemExtent: MediaQuery.of(context).size.height * .4,
          elevation: 5,
          children:
              characters
                  .map(
                    (e) => Stack(
                      children: [
                        ImageWidget(
                          url: e.thumbnail.path,
                          size: MediaQuery.of(context).size.height * .5,
                        ),
                        Positioned(
                          left: 16,
                          bottom: 16,
                          child: Text(
                            e.name,

                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blueAccent,
                            ),
                            textScaler: TextScaler.linear(
                              ScaleSize.textScaleFactor(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
