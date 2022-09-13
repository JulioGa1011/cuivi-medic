// ignore_for_file: avoid_types_as_parameter_names

import 'package:cuivi_medic/ui/home/screens/third/screens/drug_fields.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddMedicament extends StatefulWidget {
  const AddMedicament({super.key});

  @override
  State<AddMedicament> createState() => _AddMedicamentState();
}

class _AddMedicamentState extends State<AddMedicament> {
  final TextEditingController _medicamentName = TextEditingController();
  bool addMedicament = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Medicamentos', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: InputWidget(
                hintText: 'Medicamentos',
                onSubmitted: (value) {},
                validate: (num) {},
                controller: _medicamentName,
              ),
            ),
            IconButton(
                onPressed: () {
                  if (_medicamentName.text.isNotEmpty) {
                    setState(() {
                      addMedicament = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DrugFields(
                                name: _medicamentName.text,
                              )),
                    );
                  }
                },
                icon: const Icon(
                  FontAwesomeIcons.solidSquarePlus,
                  color: Colors.blueAccent,
                ))
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
