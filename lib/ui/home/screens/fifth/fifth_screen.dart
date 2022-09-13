import 'package:cuivi_medic/ui/home/screens/fifth/screen/store.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarWidget(
        isShowBack: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo1.png',
              width: size.width * 0.25,
            ),
            const Text(
              'Médicos',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        actions: const [
          // ProfileButton(),
        ],
      ),
      body: const StoreScreen(),
    );
  }
}
