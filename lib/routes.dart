import 'package:cuivi_medic/ui/home/home_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Map<String, WidgetBuilder> route() {
    return <String, WidgetBuilder>{
      HomeScreen.route: (context) => const HomeScreen(),
      'empty': (context) => const Scaffold(),
    };
  }
}
