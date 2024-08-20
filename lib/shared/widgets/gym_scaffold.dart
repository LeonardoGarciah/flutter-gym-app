import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';
import 'package:flutter_gym_app/shared/widgets/gym_side_drawer_.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';

class GymScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatActionButton;
  final String? title;
  final AppBar? appBar;

  const GymScaffold({
    super.key,
    required this.body,
    this.title,
    this.appBar,
    this.floatActionButton,
  });

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = GetService.getBloc(() => UserBloc());

    var isLogged = userBloc.state.user?.token != null;

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: floatActionButton,
      drawer: isLogged ? const GymSideDrawer() : null,
    );
  }
}
