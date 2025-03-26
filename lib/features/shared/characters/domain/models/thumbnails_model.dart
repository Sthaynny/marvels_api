class ThumbnailsModel {
  final String path;
  final String ext;

  ThumbnailsModel({required this.path, required this.ext});

  factory ThumbnailsModel.fromMap(Map<String, dynamic> map) {
    return ThumbnailsModel(path: map['path'], ext: map['extension']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'path': path, 'extension': ext};
  }
}
