import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/exercise/views/exercise_page.dart';
import 'package:flutter_gym_app/modules/home/views/home_page.dart';
import 'package:flutter_gym_app/shared/services/get_service.dart';

class GymSideDrawer extends StatelessWidget {
  const GymSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              'Gym App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              GetService.off(() => const HomePage());
            },
          ),
          ListTile(
            title: const Text('Exercises'),
            onTap: () {
              GetService.off(() => const ExercisePage());
            },
          ),
          ListTile(
            title: const Text('Workouts'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      )
    );
  }
}
