import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/password_field_sign_up.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/phone_field_sign_up.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/user_name_field_sign_up.dart';
import 'already_have_account_sign_up.dart';
import 'button_sign_up.dart';
import 'confirm_password_field.dart';
import 'email_field_sign_up.dart';
import 'first_name_field_sign_up.dart';
import 'last_name_field_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            UserNameFieldSignUp(),
            _buildSpacer(),
            Row(
              children: [
                Expanded(
                  child: FirstNameFieldSignUp(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: LastNameFieldSignUp(),
                ),
              ],
            ),
            _buildSpacer(),
            EmailFieldSignUp(),
            _buildSpacer(),
            Row(
              children: [
                Expanded(
                  child: PasswordFieldSignUp(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ConfirmPasswordField(),
                )
              ],
            ),
            _buildSpacer(),
            PhoneFieldSignUp(),
            _buildSpacer(48),
            ButtonSignUp(),
            _buildSpacer(16),
            AlreadyHaveAccountSignUp(),
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
