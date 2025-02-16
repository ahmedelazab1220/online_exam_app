import 'package:online_exam_app/core/utils/extenstion/translations.dart';

class Validator {
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "".emailCanNotBeEmpty;
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
            r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "".enterAValidEmail;
    }
    return null;
  }
}
