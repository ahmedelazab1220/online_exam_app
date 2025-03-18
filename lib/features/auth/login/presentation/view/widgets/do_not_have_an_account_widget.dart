import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/login_cubit/login_cubit.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<LoginCubit>(context);
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: LocaleKeys.Authentication_DonotHaveAnAccount.tr(),
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: LocaleKeys.Authentication_SignUp.tr(),
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                viewModel.doIntent(NavigateToSignupScreenAction());
              },
          ),
        ],
      ),
    );
  }
}
