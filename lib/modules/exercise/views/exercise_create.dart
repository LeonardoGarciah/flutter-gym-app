import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/exercise/controllers/create_exercise_controller.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gyn_text_form_field.dart';
import 'package:gap/gap.dart';

class ExerciseCreate extends StatelessWidget {
  const ExerciseCreate({super.key});

  @override
  Widget build(BuildContext context) {
    CreateExerciseController controller = CreateExerciseController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Exercicio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GymTextFormField(
              controller: controller.name,
              prefixIcon: Icons.fitness_center,
              hintText: 'Nome',
            ),
            const Gap(16),
            GymTextFormField(
              controller: controller.description,
              prefixIcon: Icons.description,
              hintText: 'Descrição',
            ),
            const Gap(16),
            GymTextFormField(
              controller: controller.videoUrl,
              prefixIcon: Icons.video_library,
              hintText: 'URL do vídeo',
            ),
            const Gap(16),
            GymTextFormField(
              controller: controller.imagePreview,
              prefixIcon: Icons.image,
              hintText: 'URL da imagem',
            ),
            const Gap(16),
            GymButton(
              'Salvar',
              onPressed: controller.create,
            ),
          ],
        ),
      ),
    );
  }
}
