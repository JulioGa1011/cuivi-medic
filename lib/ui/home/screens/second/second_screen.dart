import 'package:cuivi_medic/ui/home/screens/second/widgets/code.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/patients.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: Text(
            'Mis Pacientes',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          actions: [
            // ProfileButton(),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Container(
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.blue[100],
                ),
                child: Center(
                    child: Column(
                  children: const [Code(), SizedBox(height: 20), Patients()],
                )),
              ),
            )
          ]),
        ))));
  }
}
