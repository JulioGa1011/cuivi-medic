import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/format.dart';
import 'package:flutter/material.dart';

class AlertScreenFormat extends StatefulWidget {
  const AlertScreenFormat({Key? key}) : super(key: key);

  @override
  State<AlertScreenFormat> createState() => _AlertScreenFormatState();
}

class _AlertScreenFormatState extends State<AlertScreenFormat> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar nota'),
      content: Column(
        children: [
          const Text('Elige el tipo de nota que quieras agregar'),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Format();
                });
            // Navigator.of(context).pop(
            //   MaterialPageRoute(
            //     builder: (context) => const Format(),
            //   ),
            // );
            logger.d('aceptar');
          },
        ),
      ],
    );
  }
}
