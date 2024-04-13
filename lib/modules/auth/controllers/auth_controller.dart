import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/views/login_page.dart';

class AuthController {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    static Widget verifyAuthenticateRoute() {
        // TODO Check if user is authenticated
       if (true) {
           // TODO Add home page
           return const LoginPage();
       }

       return const LoginPage();
    }
}