import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthController.verifyAuthenticateRoute(),
    );
  }
}
