import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class DrugFields extends StatefulWidget {
  String? name;
  DrugFields({super.key, this.name});

  @override
  State<DrugFields> createState() => _DrugFieldsState();
}

class _DrugFieldsState extends State<DrugFields> {
  final TextEditingController _medicamentName = TextEditingController();
  final TextEditingController _tradename = TextEditingController();
  final TextEditingController _days = TextEditingController();
  final TextEditingController _hours = TextEditingController();
  final TextEditingController _administration = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _medicamentName.text == widget.name;
    return Scaffold(
      appBar: const AppBarWidget(
        isShowBack: true,
        title: Text('Datos del medicamento ',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InputWidget(
              hintText: 'Nombre Generico',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _medicamentName,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Nombre Comercial',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _tradename,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Presentación',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _administration,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Dias ',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _days,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Horas ',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _hours,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Vía de administracion ',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _administration,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Gramaje',
              onSubmitted: (value) {},
              validate: (num) {},
              controller: _administration,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
