import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_view.dart';
import '../../features/forget_password/presentation/view/forget_password_view.dart';
import '../../features/otp_verify/presentation/view/otp_verify_view.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String otpVerifyRoute = "/otpVerify";
  static const String resetPasswordRoute = "/resetPassword";

  static Map<String, Widget Function(dynamic)> routes = {
    loginRoute: (context) => LoginView(),
    signUpRoute: (context) => SignUpView(),
    forgetPasswordRoute: (context) => ForgetPasswordView(),
    otpVerifyRoute: (context) => OtpVerifyView(),
  };
}
