import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

@lazySingleton
class Validator {
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return LocaleKeys.Error_EmailCannotBeEmpty.tr();
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return LocaleKeys.Error_EnterAValidEmail.tr();
    }
    return null;
  }

  String? validatePassword(String input) {
    if (input.isEmpty) {
      return LocaleKeys.Error_PasswordCannotBeEmpty.tr();
    } else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
        .hasMatch(input)) {
      return LocaleKeys.Authentication_PasswordRequirements.tr();
    }
    return null;
  }

  String? validateConfirmPassword(String input, String password) {
    if (input.isEmpty || input != password) {
      return LocaleKeys.Error_ConfirmPasswordMustMatch.tr();
    }
    return null;
  }
}
