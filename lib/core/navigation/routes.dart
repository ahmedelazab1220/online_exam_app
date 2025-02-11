import 'package:flutter/material.dart';
import 'package:online_exam_app/features/auth/sign_up/presentation/view/sign_up_view.dart';

import '../../features/forget_password/presentation/view/forget_password_view.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String otpVerifyRoute = "/otpVerify";

  static Map<String, Widget Function(dynamic)> routes = {
    forgetPasswordRoute: (_) => const ForgetPasswordView(),
  };
}
