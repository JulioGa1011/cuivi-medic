import 'package:flutter/material.dart';

class Qr extends StatefulWidget {
  const Qr({super.key});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: const Text('QR')),
    );
  }
}
