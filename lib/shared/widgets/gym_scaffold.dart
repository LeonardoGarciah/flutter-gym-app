import 'package:flutter/material.dart';
import 'package:flutter_gym_app/shared/widgets/gym_text.dart';

class GymScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final AppBar? appBar;

  GymScaffold({
    super.key,
    required this.body,
    this.title,
    this.appBar,
  }) {
    assert(
      (title != null && appBar == null) ||
          (title == null && appBar != null),
      'You must provide a title or an AppBar',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: GymText(title ?? ''),
          ),
      body: body,
    );
  }
}
