import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/login_cubit/login_cubit.dart';

class RememberMeAndForgetPasswordWidget extends StatefulWidget {
  const RememberMeAndForgetPasswordWidget({super.key});

  @override
  State<RememberMeAndForgetPasswordWidget> createState() =>
      _RememberMeAndForgetPasswordWidgetState();
}

class _RememberMeAndForgetPasswordWidgetState
    extends State<RememberMeAndForgetPasswordWidget> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<LoginCubit>(context);
    return Row(
      children: [
        Checkbox(
          value: isRememberMe,
          onChanged: (value) {
            isRememberMe = value!;
            setState(() {});
          },
        ),
        Text(
          LocaleKeys.Authentication_RememberMe.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            viewModel.doIntent(NavigateToForgetPasswordScreenAction());
          },
          style: TextButton.styleFrom(
            foregroundColor: AppColors.black,
            padding: EdgeInsets.zero,
          ),
          child: Text(LocaleKeys.Authentication_ForgetPassword.tr()),
        )
      ],
    );
  }
}
