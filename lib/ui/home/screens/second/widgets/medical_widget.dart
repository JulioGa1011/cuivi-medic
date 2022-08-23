import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalWidget extends StatefulWidget {
  String text;
  IconData icon;
  MedicalWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  State<MedicalWidget> createState() => _MedicalWidgetState();
}

class _MedicalWidgetState extends State<MedicalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 211, 231, 248),
        border: Border.all(
          color: const Color(0xFF04589A),
          width: 4,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                widget.icon,
                color: Colors.blue,
              ),
              const SizedBox(width: 10),
              Text(widget.text)
            ],
          ),
        ],
      ),
    );
  }
}
