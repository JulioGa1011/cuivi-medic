// ignore_for_file: deprecated_member_use

import 'package:cuivi_medic/ui/auth/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/input_widget.dart';
import '../../home/home_screen.dart';
import '../../services/login_services.dart';

class SignupPage extends StatefulWidget {
  static const route = 'signup';

  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final _isLoading = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {});
      LoginServices(context)
          .registerUser(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
      )
          .then((value) {
        LoginServices(context)
            .requestLogin(
          _emailController.text,
          _passwordController.text,
        )
            .then((value) {
          setState(() {});
          Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: const HomeScreen(),
            ),
            (Route<dynamic> route) => false,
          );
        });
      }).catchError((error) {
        setState(() {});
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0,
                          height: size.width * 0.05,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Unete a CUIVI',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Crea una cuenta y empieza a llevar el control de tu salud al siguiente nivel.',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 20),
                        InputWidget(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textCapitalization: TextCapitalization.words,
                          controller: _nameController,
                          onSubmitted: (val) {},
                          validate: (val) {
                            if (val!.trim().isEmpty) {
                              return 'Introduce tu nombre';
                            }
                            return null;
                          },
                          hintText: 'Nombre',
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 15),
                        InputWidget(
                          autocorrect: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textCapitalization: TextCapitalization.none,
                          controller: _emailController,
                          onSubmitted: (val) {},
                          validate: (val) {
                            if (val!.trim().isEmpty) {
                              return 'Introduce tu correo electrónico';
                            }
                            return null;
                          },
                          hintText: 'Correo Electrónico',
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 15),
                        InputWidget(
                          controller: _passwordController,
                          textCapitalization: TextCapitalization.none,
                          onSubmitted: (val) {},
                          onComplete: () {
                            FocusScope.of(context)
                                .requestFocus(_confirmPasswordFocusNode);
                          },
                          validate: (val) {
                            if (val!.trim().length < 8) {
                              return 'Mínimo 8 caracteres';
                            }
                            if (val != _confirmPasswordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                          hintText: 'Contraseña',
                          isPassword: true,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        InputWidget(
                          focus: _confirmPasswordFocusNode,
                          textCapitalization: TextCapitalization.none,
                          onSubmitted: (val) {},
                          controller: _confirmPasswordController,
                          validate: (val) {
                            if (val! != _passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            if (val.trim().length < 8) {
                              return 'Mínimo 8 caracteres';
                            }
                            return null;
                          },
                          hintText: 'Confirmar Contraseña',
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 91, 54, 224)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            child: const Text(
                              'Registrarme',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            onPressed: () {
                              _submitForm();
                              // _login(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('¿Ya tienes una cuenta?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  LoginPage.route,
                                );
                              },
                              child: const Text('Iniciar Sesión'),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0,
                          height: size.width * 0.1,
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Al registrarme estoy de acuerdo y acepto los\n',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              TextSpan(
                                text: 'Términos y condiciones ',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  color: Colors.redAccent,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                      'https://pub.dev/packages/url_launcher',
                                    );
                                  },
                              ),
                              TextSpan(
                                text: 'y ',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              TextSpan(
                                text: 'Política de privacidad ',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  color: Colors.redAccent,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                      'https://pub.dev/packages/url_launcher',
                                    );
                                  },
                              ),
                              TextSpan(
                                text: 'de CUIVI.',
                                style: TextStyle(
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
