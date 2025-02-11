import 'package:flutter/material.dart';
import '../../../../../core/navigation/navigation_manager.dart';
import '../../../../../core/navigation/routes.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget password',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Please enter your email associated to your account',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                NavigationManager.push(AppRoutes.otpVerifyRoute);
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
