import 'package:marvels_api/features/shared/characters/domain/models/thumbnails_model.dart';

class CharacterModel {
  final int id;
  final String name;
  final String description;
  final ThumbnailsModel thumbnail;
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: ThumbnailsModel.fromMap(map['thumbnail']),
    );
  }

  CharacterModel copyWith({
    int? id,
    String? name,
    String? description,
    ThumbnailsModel? thumbnail,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, description: $description, thumbnail: $thumbnail)';
  }
}
