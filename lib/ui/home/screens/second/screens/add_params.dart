import 'package:flutter/material.dart';

class AddParam extends StatefulWidget {
  const AddParam({super.key});

  @override
  State<AddParam> createState() => _AddParamState();
}

class _AddParamState extends State<AddParam> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Hola'),
    );
  }
}
