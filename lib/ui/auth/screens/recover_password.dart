import 'package:flutter/material.dart';
import '../../../widgets/input_widget.dart';
import 'login.dart';

class RecoverPassword extends StatefulWidget {
  static const route = 'recover-password';

  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final _isLoading = false;

  // void _submit(BuildContext context) {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     LoginServices(context)
  //         .recoverPassword(_emailController.text)
  //         .then((value) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ValidateCodeScreen(
  //             email: _emailController.text,
  //           ),
  //         ),
  //       );
  //     }).catchError((error) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }

  //   return;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recuperar Contraseña',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Ingresa tu correo electrónico y nosotros te enviaremos las instrucciones para restablecer tu contraseña.',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 20),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: InputWidget(
                        controller: _emailController,
                        textCapitalization: TextCapitalization.none,
                        textInputType: TextInputType.emailAddress,
                        onSubmitted: (val) {},
                        validate: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Introduce tu correo electrónico';
                          }
                          return null;
                        },
                        hintText: 'Correo Electrónico',
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 91, 54, 224)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side:
                                        const BorderSide(color: Colors.blue)))),
                        child: const Text(
                          'Enviar correo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () {
                          // _login(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      '¡No tengo problemas con mi contraseña!',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, LoginPage.route);
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
