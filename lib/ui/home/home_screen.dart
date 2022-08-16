import 'package:cuivi_medic/ui/home/screens/fifth/fifth_screen.dart';
import 'package:cuivi_medic/ui/home/screens/first/first_screen.dart';
import 'package:cuivi_medic/ui/home/screens/four/four_screen.dart';
import 'package:cuivi_medic/ui/home/screens/second/second_screen.dart';
import 'package:cuivi_medic/ui/home/screens/third/third_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const route = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var page;

  @override
  void initState() {
    page ??= 0;
    super.initState();
  }

  final screens = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourScreen(),
    const FifthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              page = value;
            });
          },
          currentIndex: page,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bot_nav_bar/home.png',
                height: 25,
                color: page == 0 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bot_nav_bar/archive.png',
                height: 25,
                color: page == 1 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bot_nav_bar/medical-report.png',
                height: 25,
                color: page == 2 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bot_nav_bar/medical-report (1).png',
                height: 25,
                color: page == 3 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/bot_nav_bar/icon.png',
                height: 25,
                color: page == 4 ? Colors.blue : Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
