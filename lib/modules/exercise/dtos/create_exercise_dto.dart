class CreateExerciseDto {
  final String name;
  final String description;
  final String videoUrl;
  final String imagePreview;

  CreateExerciseDto(
      {required this.name, required this.description, required this.videoUrl, required this.imagePreview});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'imagePreview': imagePreview,
    };
  }

  factory CreateExerciseDto.fromJson(Map<String, dynamic> json) {
    return CreateExerciseDto(
      name: json['name'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      imagePreview: json['imagePreview'],
    );
  }

  CreateExerciseDto copyWith({
    String? name,
    String? description,
    String? videoUrl,
    String? imagePreview,
  }) {
    return CreateExerciseDto(
      name: name ?? this.name,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      imagePreview: imagePreview ?? this.imagePreview,
    );
  }
}
