import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class EmailFieldSignUp extends StatelessWidget {
  const EmailFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      decoration: InputDecoration(
        hintText: context.enterYourEmail,
        labelText: context.email,
      ),
    );
  }
}
