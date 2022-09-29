import 'package:cuivi_medic/ui/auth/screens/recover_password.dart';
import 'package:cuivi_medic/ui/home/home_screen.dart';
import 'package:cuivi_medic/ui/services/login_services.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  static const route = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      LoginServices(context)
          .requestLogin(
        _emailController.text,
        _passwordController.text,
      )
          .then((res) {
        if (res.statusCode == 200) {
          //   OneSignal.shared.getDeviceState().then((deviceState) async {
          //     if (deviceState?.subscribed == true) {
          //       await OneSignal.shared.setExternalUserId(
          //           res.data['user_id'].toString(),
          //           res.data['external_user_id_auth_hash']);
          // }
          // });
        }

        res.data['email_verified_at'] == null
            ? const AlertDialog(
                title: Text('Correo no confirmado'),
                actions: [Text('Aceptar')],
              )
            : Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.route,
                (Route<dynamic> route) => false,
              );
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
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
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: size.height* 0.1),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset('assets/images/logo1.png'),
                      ),

                      SizedBox(
                        width: size.width * 0,
                        height: size.width * 0.05,
                      ),
                      /*Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bienvenido',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),*/
                      const SizedBox(height: 50),

                      /*Text(
                        'Ingresa tu correo y contraseña para poder disfrutar de CUIVI',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),*/
                      const SizedBox(height: 20),

                      InputWidget(
                        onSaved: (p0) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSubmitted: (text) {},
                        textCapitalization: TextCapitalization.none,
                        validate: (text) {
                          if (text!.trim().isEmpty) {
                            return 'Introduce tu correo electrónico';
                          }
                          return null;
                        },
                        hintText: 'Correo Electrónico',
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      InputWidget(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSubmitted: (text) {},
                        onComplete: () {
                          _login(context);
                        },
                        textCapitalization: TextCapitalization.none,
                        validate: (text) {
                          if (text!.trim().isEmpty) {
                            return 'Introduce tu contraseña';
                          }
                          return null;
                        },
                        hintText: 'Contraseña',
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RecoverPassword.route,
                            );
                          },
                          child: const Text('Olvidé mi Contraseña'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(255, 91, 54, 224)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0),
                                          side: const BorderSide(
                                              color: Colors.blue)))),
                              child: const Text(
                                'Ingresar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              onPressed: () {
                                _login(context);
                              },
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.fingerprint , size: 40,))
                        ],
                      ),
                      const SizedBox(height: 30),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('¿No tienes cuenta aún?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'signup');
                            },
                            child: const Text('Registarme'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
