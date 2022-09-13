import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/first/profile/photo.dart';
import 'package:cuivi_medic/ui/home/screens/first/profile/screens/personal_inform.dart';
import 'package:cuivi_medic/ui/home/screens/first/profile/screens/qr.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'screens/info.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Información profesional',
      style: optionStyle,
    ),
    Text(
      'Index 2: Información personal',
      style: optionStyle,
    ),
    Text(
      'Index 3: QR',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    logger.d(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  bool info = true;
  // ignore: prefer_typing_uninitialized_variables
  var color1;
  // ignore: prefer_typing_uninitialized_variables
  var color2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isShowBack: true),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Profesional',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Personal ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Photo(),
            _selectedIndex == 0
                ? const Information()
                : _selectedIndex == 1
                    ? const PersonalInformation()
                    : const Qr()
          ],
        ),
      ),
    );
  }
}
