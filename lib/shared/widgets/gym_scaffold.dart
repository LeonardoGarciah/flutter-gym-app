import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';

class GymScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final AppBar? appBar;

  const GymScaffold({
    super.key,
    required this.body,
    this.title,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
