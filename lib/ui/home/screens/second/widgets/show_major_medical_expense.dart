import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:flutter/material.dart';

class ShowMedicalExpensive extends StatefulWidget {
  String name;
  String num;
  bool seg;
  ShowMedicalExpensive(
      {Key? key, required this.name, required this.num, required this.seg})
      : super(key: key);

  @override
  State<ShowMedicalExpensive> createState() => _ShowMedicalExpensiveState();
}

class _ShowMedicalExpensiveState extends State<ShowMedicalExpensive> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Row(
          children: [
            widget.seg == true
                ? const Text('Seguro: ')
                : const Text('Nombre: '),
            Text(
              widget.name,
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Numero: '),
            Text(
              widget.num,
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
          ],
        )
      ]),
    );
  }
}
