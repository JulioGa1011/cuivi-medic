import 'package:cuivi_medic/ui/home/screens/four/screens/notes.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/notes.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FourScreen extends StatefulWidget {
  const FourScreen({Key? key}) : super(key: key);

  @override
  State<FourScreen> createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          'Mis documentos y facturación',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          // ProfileButton(),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          NotesScreen(),
          Text('FourthScreen'),
        ],
      )),
    );
  }
}
