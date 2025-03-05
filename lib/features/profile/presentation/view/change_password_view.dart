import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/features/profile/presentation/view/widgets/change_password_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Profile_ResetPassword.tr()),
        ),
        body: ChangePasswordForm()
    );
  }
}
