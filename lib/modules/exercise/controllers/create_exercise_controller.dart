import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/exercise/dtos/create_exercise_dto.dart';
import 'package:flutter_gym_app/modules/exercise/repositories/exercise_repository.dart';

class CreateExerciseController {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController videoUrl = TextEditingController();
  TextEditingController imagePreview = TextEditingController();

  final ExerciseRepository _exerciseRepository = ExerciseRepository();

  void create() async {
    var dto = CreateExerciseDto(
      name: name.text,
      description: description.text,
      videoUrl: videoUrl.text,
      imagePreview: imagePreview.text,
    );

    await _exerciseRepository.create(dto);
  }
}
