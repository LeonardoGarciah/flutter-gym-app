import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gym_app/shared/repositories/bloc/user_bloc/user_bloc.dart';

class MultiRepositoryProviderCore extends StatelessWidget {
  final Widget child;

  const MultiRepositoryProviderCore({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: child,
    );
  }
}
