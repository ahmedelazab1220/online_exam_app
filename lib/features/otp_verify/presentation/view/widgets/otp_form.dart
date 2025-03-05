import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';
import '../../view_model/otp_verify_cubit/otp_verify_cubit.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<OtpVerifyCubit>(context);
    return BlocBuilder<OtpVerifyCubit, OtpVerifyState>(
      builder: (context, state) {
        return Form(
          onChanged: () => viewModel.doIntent(FormDataChangedAction()),
          key: viewModel.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: List.generate(6, (index) {
                  return Flexible(
                    child: TextFormField(
                      onChanged: (value) {
                        viewModel.doIntent(EnterOtpAction(
                          index: index,
                          otpCode: value,
                        ));
                      },
                      validator: (value) =>
                          viewModel.validateOtpfield(value ?? ""),
                      controller: viewModel.controllers[index],
                      focusNode: viewModel.focusNodes[index],
                      autofocus: index == 0,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: state.baseState is BaseErrorState
                            ? AppColors.white
                            : AppColors.paleBlue,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: Theme.of(context)
                              .inputDecorationTheme
                              .focusedBorder!
                              .borderSide,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: Theme.of(context)
                              .inputDecorationTheme
                              .focusedErrorBorder!
                              .borderSide,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: Theme.of(context)
                              .inputDecorationTheme
                              .errorBorder!
                              .borderSide,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).primaryColor,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                      onTapOutside: (value) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  );
                })
                    .expand((widget) => [widget, const SizedBox(width: 8.0)])
                    .toList()
                  ..removeLast(),
              ),
              if (state.baseState is BaseErrorState)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppIcons.errorIcon),
                    const SizedBox(width: 4),
                    Text(
                      LocaleKeys.Authentication_InvalidCode.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.red,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
