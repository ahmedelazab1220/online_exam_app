import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';
import '../../../../../../core/navigation/navigation_manager.dart';
import '../../../../../../core/navigation/routes.dart';

class AlreadyHaveAccountSignUp extends StatelessWidget {
  const AlreadyHaveAccountSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.alreadyHaveAnAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 4),
            minimumSize: Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            NavigationManager.replace(AppRoutes.loginRoute);
          },
          child: Text(
            context.login,
          ),
        ),
      ],
    );
  }
}
