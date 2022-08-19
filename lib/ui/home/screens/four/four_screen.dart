import 'package:flutter/material.dart';

class FourScreen extends StatefulWidget {
  const FourScreen({Key? key}) : super(key: key);

  @override
  State<FourScreen> createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('FourthScreen'));
  }
}
