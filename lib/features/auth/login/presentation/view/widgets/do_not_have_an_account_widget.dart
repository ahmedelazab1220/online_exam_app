import 'package:flutter/material.dart';
import 'package:online_exam_app/core/navigation/navigation_manager.dart';
import 'package:online_exam_app/core/navigation/routes.dart';
import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.donotHaveAnAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(left: 4),
            minimumSize: Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            NavigationManager.replace(AppRoutes.signUpRoute);
          },
          child: Text(
            context.signUp,
          ),
        ),
      ],
    );
  }
}
