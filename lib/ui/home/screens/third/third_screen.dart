import 'package:cuivi_medic/ui/home/screens/third/screens/add_prescription.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        centerTitle: true,
        title: Text(
          'Crear receta',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          // ProfileButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [AddPrescription()],
        ),
      ),
    );
  }
}
