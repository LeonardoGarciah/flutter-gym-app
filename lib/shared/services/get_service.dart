import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as flutter_bloc;
import 'package:get/get.dart';

class GetService {
  static T getBloc<T extends flutter_bloc.StateStreamableSource<Object?>>(T Function() bloc,
      {BuildContext? context}) {
    if ((context ?? Get.context) != null) {
      return flutter_bloc.BlocProvider.of<T>(context ?? Get.context!);
    } else {
      return bloc();
    }
  }

  static Future? to(
      Widget Function() page, {
        Object? arguments,
        bool preventDuplicates = true,
        Transition transition = Transition.rightToLeft,
      }) {
    // Use the Get.to() method to navigate to the page.
    return Get.to(
      page, // Call the page function to get the actual page widget.
      arguments: arguments,
      preventDuplicates: preventDuplicates,
      transition: transition,
    );
  }

  static Future? off(
      Widget Function() page, {
        Object? arguments,
        bool preventDuplicates = true,
        Transition transition = Transition.rightToLeft,
      }) {
    // Use the Get.off() method to navigate to the page and remove the current page.
    return Get.off(
      page, // Call the page function to get the actual page widget.
      arguments: arguments,
      preventDuplicates: preventDuplicates,
      transition: transition,
    );
  }

  static Future? offAll(
      Widget Function() page, [
        Transition transition = Transition.rightToLeft,
      ]) {
    // Use the Get.offAll() method to navigate to the page and remove all previous pages.
    return Get.offAll(
      page, // Call the page function to get the actual page widget.
      transition: transition,
    );
  }

  static void back() {
    // Use the Get.back() method to navigate back to the previous page.
    Get.back();
  }

  static void snackbar(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Use the Get.snackbar() method to show a snackbar.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
    );
  }

  static void dialog(
      String title, {
        String message = '',
        String confirmText = 'OK',
        Function()? onConfirm,
        String cancelText = 'Cancel',
        Function()? onCancel,
      }) {
    // Use the Get.defaultDialog() method to show a dialog.
    Get.defaultDialog(
      title: title,
      middleText: message,
      confirm: CupertinoButton(
        child: Text(confirmText),
        onPressed: onConfirm,
      ),
      cancel: CupertinoButton(
        child: Text(cancelText),
        onPressed: onCancel,
      ),
    );
  }

  static void bottomSheet(
      Widget Function() builder, {
        Color? backgroundColor,
        double? elevation,
        ShapeBorder? shape,
        Clip? clipBehavior,
        Color? barrierColor,
        bool enableDrag = true,
        bool isDismissible = true,
      }) {
    // Use the Get.bottomSheet() method to show a bottom sheet.
    Get.bottomSheet(
      builder(),
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
    );
  }

  static void snackbarError(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Use the Get.snackbar() method to show a snackbar with an error style.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  static void snackbarSuccess(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Use the Get.snackbar() method to show a snackbar with a success style.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  static void snackbarWarning(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Use the Get.snackbar() method to show a snackbar with a warning style.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  static void snackbarInfo(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
      }) {
    // Use the Get.snackbar() method to show a snackbar with an info style.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }

  static void snackbarCustom(
      String title, {
        String message = '',
        SnackPosition position = SnackPosition.BOTTOM,
        Duration duration = const Duration(seconds: 3),
        Color? backgroundColor,
        Color? colorText,
      }) {
    // Use the Get.snackbar() method to show a snackbar with a custom style.
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      duration: duration,
      backgroundColor: backgroundColor,
      colorText: colorText,
    );
  }

}