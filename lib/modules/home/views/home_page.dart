import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter_gym_app/shared/widgets/gym_button.dart';
import 'package:flutter_gym_app/shared/widgets/gym_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GymScaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          GymButton('Deslogar-se', onPressed: () {
            AuthController.logout();
          }),
        ],
      ),
    );
  }
}
