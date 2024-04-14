import 'package:flutter/material.dart';
import 'package:flutter_gym_app/modules/user_additional_information/controllers/user_step_controller.dart';

class UserStepProvider extends InheritedWidget {
  final UserStepController userStepController;

  const UserStepProvider(this.userStepController, {
    super.key,
    required Widget child,
  }) : super(child: child);

  static UserStepProvider of(BuildContext context) {
    final UserStepProvider? result =
        context.dependOnInheritedWidgetOfExactType<
            UserStepProvider>();
    assert(result != null,
        'No UserStepProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UserStepProvider old) {
    return old.userStepController.currentStep.value !=
        userStepController.currentStep.value;
  }
}
