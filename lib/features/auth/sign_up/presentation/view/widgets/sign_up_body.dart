import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'already_have_account_sign_up.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: context.enterYourUserName,
                labelText: context.userName,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: context.enterFirstName,
                      labelText: context.firstName,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: context.enterLastName,
                      labelText: context.lastName,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: context.enterYourEmail,
                labelText: context.email,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: context.enterYourPassword,
                      labelText: context.password,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: context.confirmPassword,
                      labelText: context.confirmPassword,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: context.enterPhoneNumber,
                labelText: context.phoneNumber,
              ),
            ),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(context.signUp),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            AlreadyHaveAccountSignUp(),
          ],
        ),
      ),
    );
  }
}