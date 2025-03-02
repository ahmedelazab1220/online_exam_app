import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/assets/app_colors.dart';
import 'package:online_exam_app/core/navigation/routes.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';
import 'package:online_exam_app/features/profile/presentation/view/widgets/profile_pick_image.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfilePickImage(),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterYourUserName.tr(),
                labelText: LocaleKeys.Authentication_UserName.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                spacing: 16.0,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Authentication_EnterFirstName.tr(),
                        labelText: LocaleKeys.Authentication_FirstName.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.Authentication_EnterLastName.tr(),
                        labelText: LocaleKeys.Authentication_LastName.tr(),
                      ),
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterYourEmail.tr(),
                labelText: LocaleKeys.Authentication_Email.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterYourPassword.tr(),
                labelText: LocaleKeys.Authentication_Password.tr(),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.resetPasswordRoute);
                    },
                    child: Text(LocaleKeys.Profile_Change.tr(),style: TextStyle(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                )
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.Authentication_EnterPhoneNumber.tr(),
                labelText: LocaleKeys.Authentication_PhoneNumber.tr(),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
            SizedBox(
              height: 48.0,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(LocaleKeys.Profile_Update.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
