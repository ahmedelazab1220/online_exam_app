import 'package:flutter/material.dart';
import 'package:online_exam_app/features/profile/presentation/view/profile_view.dart';
import 'package:online_exam_app/features/profile/presentation/view/change_password_view.dart';
import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/sign_up/presentation/view/sign_up_view.dart';
import '../../features/forget_password/presentation/view/forget_password_view.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String otpVerifyRoute = "/otpVerify";



  static const String profileRoute = "/profile";
  static const String changePasswordRoute = "/changePassword";

  static Map<String, Widget Function(dynamic)> routes = {
    loginRoute: (context) => LoginView(),
    signUpRoute: (context) => SignUpView(),
    forgetPasswordRoute: (context) => ForgetPasswordView(),



    profileRoute: (context) => ProfileView(),
    changePasswordRoute: (context) => ChangePasswordView(),

  };
}
