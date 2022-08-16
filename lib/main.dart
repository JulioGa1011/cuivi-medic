import 'package:cuivi_medic/light_theme.dart';
import 'package:cuivi_medic/routes.dart';
import 'package:cuivi_medic/ui/home/home_screen.dart';
import 'package:cuivi_medic/ui/home/tutoria_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
var logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Cuivi Medic',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: const MyHomePage(title: 'Cuivi Medic'),
      routes: Routes().route(),
      navigatorKey: navigatorKey,
      theme: LightTheme().themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          final welcome = snapshot.data!.getBool('welcome') ?? false;
          final token = snapshot.data!.getString('access_token');
          if (welcome) {
            return const TutorialScreen();
          } else {
            //return const LoginPage();
            if (token == null || token == '') {
              return const TutorialScreen();
            } else {
              return const HomeScreen();
            }
          }
        }
      },
    );

    // const LoginPage();
  }
}
