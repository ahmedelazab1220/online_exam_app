import 'package:easy_localization/easy_localization.dart';
import 'package:online_exam_app/core/utils/l10n/locale_keys.g.dart';

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
}
