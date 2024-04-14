import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/auth/dtos/login_dto.dart';
import 'package:flutter_gym_app/modules/auth/dtos/register_dto.dart';
import 'package:flutter_gym_app/modules/auth/repositories/auth_repository.dart';
import 'package:flutter_gym_app/modules/auth/views/login_page.dart';
import 'package:flutter_gym_app/modules/auth/views/register_page.dart';
import 'package:flutter_gym_app/modules/home/views/home_page.dart';
import 'package:flutter_gym_app/shared/domain/user_domain.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class AuthController {
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController name =
      TextEditingController();

  final showPassword = ValueNotifier<bool>(false);

  final AuthRepository _authRepository = AuthRepository();

  static Widget verifyAuthenticateRoute() {
    UserBloc userBloc = GetService.getBloc(() => UserBloc());

    if ((userBloc.state.user?.token ?? '').isNotEmpty) {
      return const HomePage();
    }
    return const LoginPage();
  }

  Future<void> login() async {
    UserBloc userBloc =
        GetService.getBloc(() => UserBloc());

    var loginDto = LoginDto(
      email: emailController.text,
      password: passwordController.text,
    );

    try {
      var response = await _authRepository.login(loginDto);

      userBloc.add(
        UserBlocEventUpdateUser(
          UserDomain(token: response.token),
        ),
      );

      GetService.snackbarSuccess('Entrou com sucesso!');
      GetService.off(() => const HomePage());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register() async {
    var registerDto = RegisterDto(
      email: emailController.text,
      password: passwordController.text,
      name: name.text,
    );

    try {
      await _authRepository.register(registerDto);
      GetService.snackbarSuccess('Registrado com sucesso!');
    } catch (e) {
      GetService.snackbarError('Erro ao registrar usuário!');
    } finally {
      gotoLogin();
    }
  }

  static void logout() {
    UserBloc userBloc = GetService.getBloc(() => UserBloc());
    userBloc.add(UserBlocEventClear());

    GetService.off(() => const LoginPage());
  }

  void gotoRegister() {
    GetService.off(() => const RegisterPage());
  }

  void gotoLogin() {
    GetService.off(() => const LoginPage());
  }
}
