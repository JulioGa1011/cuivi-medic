import 'package:cuivi_medic/ui/home/screens/first/profile/photo.dart';
import 'package:cuivi_medic/ui/home/screens/first/profile/screens/personal_inform.dart';
import 'package:flutter/material.dart';

import 'screens/info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool info = true;
  // ignore: prefer_typing_uninitialized_variables
  var color1;
  // ignore: prefer_typing_uninitialized_variables
  var color2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Photo(),
              const Text('ProfilePage'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: color1,
                      fixedSize: const Size.fromWidth(100),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(' Profesional'),
                    onPressed: () {
                      setState(() {
                        info = true;
                        color1 = Colors.blue;
                        color2 = Colors.grey[300];
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: color2,
                      fixedSize: const Size.fromWidth(100),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Text(' personal'),
                    onPressed: () {
                      setState(() {
                        info = false;
                        color1 = Colors.grey[300];
                        color2 = Colors.blue;
                      });
                    },
                  ),
                ],
              ),
              info ? const Information() : const PersonalInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
