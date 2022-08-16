import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const ButtonWidget({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      elevation: 3,
      color: const Color(0xFF00afef),
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: size.width * .04),
            child: Text(
              text ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * .04,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
