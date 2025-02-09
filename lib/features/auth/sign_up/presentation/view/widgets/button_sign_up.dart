import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
          }, child: Padding(
        padding: const EdgeInsets.symmetric(vertical:12 ),
        child: Text(context.signUp),
      )),
    );
  }
}
