import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/format.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/free.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/clinic_history.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AlertScreenFormat extends StatefulWidget {
  const AlertScreenFormat({Key? key}) : super(key: key);

  @override
  State<AlertScreenFormat> createState() => _AlertScreenFormatState();
}

class _AlertScreenFormatState extends State<AlertScreenFormat> {
  String dropdownValue = 'Historia clínica';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        isShowBack: true,
        title: Text(
          'Agregar nota',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Elige el tipo de nota que quieras agregar'),
              const Text(
                '(Estas notas solo son visibles para el médico que las realizo)',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: DropdownButton<String>(
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
                  items: <String>[
                    'Historia clínica',
                    'Nota de evolucion',
                    'Nota libre'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              dropdownValue == 'Historia clínica'
                  ? ClinicHistory()
                  : dropdownValue == 'Nota de evolucion'
                      ? const Format()
                      : const FreeNote(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       child: const Text('Cancelar'),
              //       onPressed: () {
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //     TextButton(
              //       child: const Text('Aceptar'),
              //       onPressed: () {
              //         showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return const Format();
              //             });
              //         // Navigator.of(context).pop(
              //         //   MaterialPageRoute(
              //         //     builder: (context) => const Format(),
              //         //   ),
              //         // );
              //         logger.d('aceptar');
              //       },
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
