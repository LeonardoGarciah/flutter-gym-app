class TrainingDTO {
    final String name;
    final String teacherId;
    final String studentId;
    final String description;
    final List<String> trainingExerciseIdList = [];

  TrainingDTO({required this.name, required this.teacherId, required this.studentId, required this.description, List<String>? trainingExerciseIdList}) {
    if (trainingExerciseIdList != null) {
      this.trainingExerciseIdList.addAll(trainingExerciseIdList);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'teacher': teacherId,
      'student': studentId,
      'description': description,
      'trainingExerciseList': trainingExerciseIdList,
    };
  }

  factory TrainingDTO.fromJson(Map<String, dynamic> json) {
    return TrainingDTO(
      name: json['name'],
      teacherId: json['teacher'],
      studentId: json['student'],
      description: json['description'],
      trainingExerciseIdList: List<String>.from(json['trainingExerciseList']),
    );
  }

  TrainingDTO copyWith({
    String? name,
    String? teacher,
    String? student,
    String? description,
    List<String>? trainingExerciseIdList,
  }) {
    return TrainingDTO(
      name: name ?? this.name,
      teacherId: teacher ?? this.teacherId,
      studentId: student ?? this.studentId,
      description: description ?? this.description,
      trainingExerciseIdList: trainingExerciseIdList ?? this.trainingExerciseIdList,
    );
  }
}