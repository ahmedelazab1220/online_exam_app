import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/user_name_field_sign_up.dart';

import 'email_field_sign_up.dart';
import 'first_name_field_sign_up.dart';
import 'last_name_field_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            UserNameFieldSignUp(),
            _buildSpacer(),
             Row(
              children: [
                Expanded(
                  child: FirstNameFieldSignUp(),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: LastNameFieldSignUp(),
                ),
              ],
            ),
            _buildSpacer(),
            EmailFieldSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacer([double? height]) {
    return SizedBox(
      height: height ?? 24,
    );
  }
}
