import 'package:flutter/material.dart';
class VerifyCode extends StatefulWidget {
  static const route = 'verify-code';

  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(children: [
          SizedBox(
            height: size.height*0.2,
          ),
          Text('Verificar Codigo', style: 
          Theme.of(context).textTheme.headline5, ),
          SizedBox(height: size.height* 0.01),
          Text('Se envió un correo a a*******@c*******', style: 
          Theme.of(context).textTheme.bodyText2, )
          
          
        ],),
      ),
    );
  }
}