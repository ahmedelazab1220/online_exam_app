import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserSessionProvider extends ChangeNotifier {
  String _email = "";

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }
}
