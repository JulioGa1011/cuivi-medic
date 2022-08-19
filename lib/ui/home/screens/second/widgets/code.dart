import 'package:flutter/material.dart';

class Code extends StatefulWidget {
  const Code({Key? key}) : super(key: key);

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Introducir codigo de vinculacion',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const TextField(
          decoration: InputDecoration(border: OutlineInputBorder()),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Agregar'))
      ],
    );
  }
}
