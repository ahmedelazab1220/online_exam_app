import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class LastNameFieldSignUp extends StatelessWidget {
  const LastNameFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: context.enterLastName,
        labelText: context.lastName,
      ),
    );
  }
}
