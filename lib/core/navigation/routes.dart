import 'package:flutter/material.dart';
import 'package:online_exam_app/features/auth/login/presentation/view/login_view.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String otpVerifyRoute = "/otpVerify";

  static Map<String, Widget Function(dynamic)> routes = {
    loginRoute: (context) => LoginView(),
  };
}
