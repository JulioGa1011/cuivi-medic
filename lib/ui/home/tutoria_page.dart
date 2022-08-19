import 'package:cuivi_medic/ui/auth/screens/login.dart';
import 'package:cuivi_medic/ui/home/screens/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: size.height,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  'Bienvenido a CUIVI Medico',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'La mejor aplicacion para mantenerte en contacto con tus pacientes ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 192, 192, 192),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: size.width,
                child: Image.asset(
                  'assets/images/tutorial/undraw_doctor_kw5l.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 91, 54, 224)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.blue)))),
                  child: const Text(
                    'Empezar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const TutorialScreen()),
                        (Route<dynamic> route) => false);
                    // welcome();
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿Ya habias usado la app?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const LoginPage()),
                            (Route<dynamic> route) => false);
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 18),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
