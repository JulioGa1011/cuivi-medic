import 'package:cuivi_medic/ui/home/screens/first/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                type: PageTransitionType.topToBottom,
                child: const ProfilePage()),
            (Route<dynamic> route) => true);
      },
      icon: const Icon(
        Icons.person_outline,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
