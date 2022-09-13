import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../auth/screens/login.dart';

class TutorialScreen extends StatefulWidget {
  static const route = 'tutorial';

  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int page = 0;

  Future<void> _setPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('welcome', false);
  }

  Future<void> welcome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('welcome', true);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1), () {
      page = _pageController.page!.toInt();
    });
    _setPreferences();
  }

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final tutoImages = [
      Align(
        alignment: Alignment.bottomRight,
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Image.asset('assets/images/tutorial/undraw_medical_care_movn.png',
              fit: BoxFit.fill, width: double.infinity),
        ]),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Image.asset(
              'assets/images/tutorial/undraw_Booked_re_vtod.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ],
        ),
      ),
      Align(
          alignment: Alignment.bottomRight,
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Image.asset(
                'assets/images/tutorial/undraw_Social_influencer_re_beim.png'),
          ])),
    ];

    _pageController.addListener(() {
      setState(() {
        page = _pageController.page!.round();
      });
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              children: tutoImages,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                        if (page == 0)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.30),
                              Text(
                                'Encuentra tus insumos médicos',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.004),
                              const Text(
                                'Contamos con una tienda especial para medicos con diferente variedad de productos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 192, 192, 192),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                            ],
                          ),
                        if (page == 1)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.32),
                              Text(
                                'Lleva el control de las citas de tus pacientes',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.002),
                              const Text(
                                'Manten en tiempo real el control de tu agenda y obtén confirmaciones de tus pacientes',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 192, 192, 192),
                                ),
                              ),
                            ],
                          ),
                        if (page == 2)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.32),
                              Text(
                                'Permite que tus futuros pacientes te encuentren',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.002),
                              const Text(
                                'Aparece en la lista de medicos de tu localidad y muestra tus especialidades',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 192, 192, 192),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        AnimatedSmoothIndicator(
                          activeIndex: page,
                          count: tutoImages.length,
                          onDotClicked: (index) {
                            _pageController.animateToPage(
                              index.toInt(),
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          },
                          duration: const Duration(milliseconds: 200),
                          effect: const WormEffect(
                            dotColor: Color.fromARGB(255, 175, 175, 175),
                            activeDotColor: Colors.blue,
                            dotWidth: 12,
                            dotHeight: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 70, 24, 236)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            child: const Text(
                              'Continuar',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            onPressed: () {
                              if (page == tutoImages.length - 1) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: const LoginPage()),
                                    (Route<dynamic> route) => false);
                                welcome();
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Colors.grey)))),
                            child: const Text(
                              'Iniciar sesion',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 70, 24, 236)),
                            ),
                            onPressed: () {
                              if (page == tutoImages.length - 1) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: const LoginPage()),
                                    (Route<dynamic> route) => false);
                                welcome();
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Ya habias usado la app?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 192, 192, 192),
                          ),
                        ),
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
                              style: TextStyle(fontSize: 15),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
