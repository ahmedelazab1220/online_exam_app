import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import '../../../../../core/assets/app_colors.dart';
import 'otp_form.dart';

class OtpVerifyForm extends StatefulWidget {
  const OtpVerifyForm({super.key});

  @override
  State<OtpVerifyForm> createState() => _OtpVerifyFormState();
}

class _OtpVerifyFormState extends State<OtpVerifyForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              LocaleKeys.Authentication_EmailVerification.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 18,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    LocaleKeys.Authentication_PleaseEnterYourCode.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32.0,
            ),
            OtpForm(),
            SizedBox(
              height: 24.0,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: LocaleKeys.Authentication_DidnotReceiveCode.tr(),
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: LocaleKeys.Authentication_Resend.tr(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
