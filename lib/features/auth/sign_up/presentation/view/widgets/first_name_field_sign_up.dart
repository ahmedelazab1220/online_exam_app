import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class FirstNameFieldSignUp extends StatelessWidget {
  const FirstNameFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: context.enterFirstName,
        labelText: context.firstName,
      ),
    );
  }
}
