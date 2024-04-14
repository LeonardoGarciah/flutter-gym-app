import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gym_app/app_widget.dart';
import 'package:flutter_gym_app/core/multi_bloc_provider_core.dart';
import 'package:flutter_gym_app/core/multi_bloc_repository_provider_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory(),
  );

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
