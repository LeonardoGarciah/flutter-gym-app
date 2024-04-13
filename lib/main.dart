import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_widget.dart';
import 'package:flutter_gym_app/core/multi_bloc_provider_core.dart';
import 'package:flutter_gym_app/core/multi_bloc_repository_provider_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProviderCore(
      child: MultiBlocProviderCore(
        child: AppWidget(),
      ),
    );
  }
}
