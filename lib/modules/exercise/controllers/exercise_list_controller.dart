import 'package:flutter/foundation.dart';
import 'package:flutter_gym_app/modules/exercise/repositories/exercise_repository.dart';
import 'package:flutter_gym_app/shared/domain/exercise_domain.dart';
import 'package:flutter_gym_app/shared/enums/loading_states_enum.dart';

class ExerciseListController {
  final loading = ValueNotifier<LoadingStatesEnum>(LoadingStatesEnum.loading);
  final exercises = ValueNotifier<List<ExerciseDomain>>([]);

  ExerciseRepository _exerciseRepository = ExerciseRepository();

  Future<void> search() async {
    loading.value = LoadingStatesEnum.loading;

    var response = await _exerciseRepository.getAll();

    exercises.value = response;

    loading.value = LoadingStatesEnum.loaded;
  }
}
