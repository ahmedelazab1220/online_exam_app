import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/app_colors.dart';
import '../../../../../core/assets/app_icons.dart';
import '../../../../../core/utils/l10n/locale_keys.g.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // i'll remove this when add viewModel
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  bool hasError = false;

  @override
  void dispose() {
    // i'll remove this when add viewModel
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // fake function i'll remove it when add viewModel
  void _checkOtp() {
    final String correctOtp = "1234";
    String enteredOtp = _controllers.map((e) => e.text).join();

    if (enteredOtp.length == 4) {
      if (enteredOtp == correctOtp) {
        setState(() {
          hasError = false;
        });
      } else {
        setState(() {
          hasError = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(4, (index) {
            return Flexible(
              child: TextFormField(
                onChanged: (value) {
                  // i'll remove this when add viewModel
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    _checkOtp();
                  }
                },
                validator: (value) {
                  // i'll remove this when add viewModel
                  if (hasError) {
                    return "";
                  }
                  return null;
                },
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                autofocus: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: hasError ? AppColors.white : AppColors.paleBlue,
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
                style: Theme.of(context).textTheme.displaySmall,
                onTapOutside: (value) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
            );
          }).expand((widget) => [widget, const SizedBox(width: 16.0)]).toList()
            ..removeLast(),
        ),
        if (hasError)
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
    );
  }
}
