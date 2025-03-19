import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

import '../widgets/profile_info.dart';
import '../widgets/user_image.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Profile_Profile.tr()),
      ),
      body : SingleChildScrollView(
        child: Column(
          children: [
            const UserImage(),
            const SizedBox(
              height: 20,
            ),
            ProfileInfo(),

          ],
        ),
      ));
  }
}
