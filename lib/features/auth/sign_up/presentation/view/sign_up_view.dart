import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/widgets/sign_up_body.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/navigation/navigation_manager.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: SignUpBody());
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
          onPressed: onPressedButtonLeading,
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          )),
       title: Text(context.signUp, style: Theme.of(context).textTheme.titleLarge,),
    );
  }

  void onPressedButtonLeading() {
    NavigationManager.goBack();
  }

}
