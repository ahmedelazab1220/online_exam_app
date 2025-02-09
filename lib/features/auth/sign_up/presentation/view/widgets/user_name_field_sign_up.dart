import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class UserNameFieldSignUp extends StatelessWidget {
  const UserNameFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        hintText: context.enterYourUserName,
        labelText: context.userName,
      ),
    );
  }
}
