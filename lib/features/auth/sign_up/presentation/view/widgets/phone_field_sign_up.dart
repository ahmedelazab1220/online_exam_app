import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class PhoneFieldSignUp extends StatelessWidget {
  const PhoneFieldSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return     TextFormField(
      decoration: InputDecoration(
        hintText: context.enterPhoneNumber,
        labelText: context.phoneNumber,
      ),
    );
  }
}
