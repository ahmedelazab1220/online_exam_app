import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/l10n/locale_keys.g.dart';
import 'widgets/otp_verify_form.dart';

class OtpVerifyView extends StatelessWidget {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Authentication_Password.tr()),
      ),
      body: OtpVerifyForm(),
    );
  }
}
