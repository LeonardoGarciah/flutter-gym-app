import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/exercise/controllers/exercise_list_controller.dart';
import 'package:flutter_gym_app/modules/exercise/views/exercise_create.dart';
import 'package:flutter_gym_app/modules/exercise/widgets/exercise_item.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';
import 'package:flutter_gym_app/shared/widgets/gym_list_view.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  ExerciseListController controller = ExerciseListController();

  @override
  void initState() {
    controller.search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GymScaffold(
      appBar: AppBar(
        title: const Text('Exercicio'),
      ),
      floatActionButton: FloatingActionButton(
        onPressed: () {
          GetService.to(() => const ExerciseCreate());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GymListView(
          state: controller.loading,
          builder: (context, index) {
            var exercise = controller.exercises.value[index];

            return ExerciseItem(exercise: exercise);
          },
          listeners: [controller.exercises],
          listToCount: controller.exercises,
          emptyListMessage: 'Nenhum exercício encontrado',
        ),
      ),
    );
  }
}
