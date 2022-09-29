import 'package:cuivi_medic/ui/auth/screens/login.dart';
import 'package:cuivi_medic/ui/auth/screens/recover_password.dart';
import 'package:cuivi_medic/ui/auth/screens/sing_up.dart';
import 'package:cuivi_medic/ui/auth/screens/verify_code.dart';
import 'package:cuivi_medic/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Map<String, WidgetBuilder> route() {
    return <String, WidgetBuilder>{
      // Home
      HomeScreen.route: (context) => const HomeScreen(),
      // Auth
      SignupPage.route: (context) => const SignupPage(),
      LoginPage.route: (context) => const LoginPage(),
      RecoverPassword.route: (context) => const RecoverPassword(),
      VerifyCode.route: (context) => const VerifyCode(),
      'empty': (context) => const Scaffold(),
    };
  }
}
