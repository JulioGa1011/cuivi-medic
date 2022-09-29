import 'package:cuivi_medic/ui/home/screens/first/widgets/profile_button.dart';
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
        appBar: AppBarWidget(
          centerTitle: true,
          title: const Text(
            'Pacientes',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list_sharp,
                  size: 30,
                  color: Colors.indigo,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.indigo,
                )),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
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
                  children: const [
                    //Code(),
                    SizedBox(height: 20), Patients()
                  ],
                )),
              ),
            )
          ]),
        ))));
  }
}
