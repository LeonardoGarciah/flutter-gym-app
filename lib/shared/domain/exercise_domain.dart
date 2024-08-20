class ExerciseDomain {
  final String id;
  final String name;
  final String description;
  final String videoUrl;
  final String imageUrl;

  ExerciseDomain({
    required this.id,
    required this.name,
    required this.description,
    required this.videoUrl,
    required this.imageUrl,
  });

  factory ExerciseDomain.fromJson(Map<String, dynamic> json) {
    print(json);
    return ExerciseDomain(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      videoUrl: json['videoUrl'],
      imageUrl: json['imagePreview'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'videoUrl': videoUrl,
      'imageUrl': imageUrl,
    };
  }

  ExerciseDomain copyWith({
    String? id,
    String? name,
    String? description,
    String? videoUrl,
    String? imageUrl,
  }) {
    return ExerciseDomain(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
