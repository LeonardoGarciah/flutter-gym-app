import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/views/login_page.dart';
import 'package:flutter_gym_app/modules/auth/views/register_page.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class AuthController {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    final showPassword = ValueNotifier<bool>(false);

    static Widget verifyAuthenticateRoute() {
        // TODO Check if user is authenticated
       if (true) {
           // TODO Add home page
           return const LoginPage();
       }
       return const LoginPage();
    }

    void gotoRegister() {
      GetService.off(() => const RegisterPage());
    }

    void gotoLogin() {
      GetService.off(() => const LoginPage());
    }
}