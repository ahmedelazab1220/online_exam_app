import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class AppDialogs {
  // Show a loading dialog
  static void showLoadingDialog(
    BuildContext context, {
    String? message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(message ?? context.loading),
            ],
          ),
        );
      },
    );
  }

  // Show a success dialog
  static void showSuccessDialog(
    BuildContext context, {
    required String message,
    String? buttonText,
    String? nextActionTitle,
    VoidCallback? nextAction,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(message),
            ],
          ),
          actions: [
            if (nextActionTitle != null)
              TextButton(
                onPressed: nextAction,
                child: Text(nextActionTitle),
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText ?? context.ok),
            ),
          ],
        );
      },
    );
  }

  // Show a failure dialog
  static void showFailureDialog(
    BuildContext context, {
    required String message,
    String? buttonText,
    VoidCallback? nextAction,
    String? nextActionTitle,
    String? title,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? context.error),
          content: Text(message),
          actions: [
            if (nextAction != null && nextActionTitle != null)
              TextButton(
                onPressed: nextAction,
                child: Text(nextActionTitle),
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(buttonText ?? context.ok),
            ),
          ],
        );
      },
    );
  }
}
