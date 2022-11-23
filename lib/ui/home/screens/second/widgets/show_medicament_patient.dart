import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:flutter/material.dart';

class ShowMedicaments extends StatefulWidget {
  List<PatientExpedientModel> expedient;
  bool? complete;
  ShowMedicaments({Key? key, required this.expedient, this.complete})
      : super(key: key);

  @override
  State<ShowMedicaments> createState() => _ShowMedicamentsState();
}

class _ShowMedicamentsState extends State<ShowMedicaments> {
  @override
  Widget build(BuildContext context) {
    logger.d(widget.expedient.first.toJson());
    return widget.complete == null
        ? Column(
            children: List.generate(widget.expedient.first.medicaments.length,
                (index) {
            final exp = widget.expedient.first.medicaments[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '-${exp.name ?? ''}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 199, 199, 199)),
                  ),
                  Text(
                    'durante ${exp.days ?? ''} dias',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 199, 199, 199)),
                  ),
                  Text(
                    'cada ${exp.hours ?? ''} Hrs.',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 199, 199, 199)),
                  ),
                ],
              ),
            );
          }))
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: widget.expedient.first.medicalRecordMedicaments.isNotEmpty
                ? Column(children: [
                    const Text('medicamentos activos'),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 254, 254),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 75, 133, 177),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: DataTable(
                                showBottomBorder: true,
                                columnSpacing: 30,
                                sortColumnIndex: 1,
                                sortAscending: false,
                                columns: const [
                                  DataColumn(label: Text("Nombre Genérico")),
                                  DataColumn(label: Text("Nombre comercial")),
                                  DataColumn(label: Text("Días")),
                                  DataColumn(
                                      label: Text("Horas"), numeric: true),
                                ],
                                rows: List.generate(
                                    widget
                                        .expedient
                                        .first
                                        .medicalRecordMedicaments
                                        .length, (index) {
                                  final medicament = widget.expedient.first
                                      .medicalRecordMedicaments[index];
                                  return DataRow(selected: true, cells: [
                                    DataCell(Text(medicament.name!)),
                                    DataCell(Text(medicament.name!)),
                                    DataCell(Text(medicament.days!)),
                                    DataCell(Text(medicament.hours!)),
                                  ]);
                                }),
                              ))
                        ])),
                  ])
                : Center(
                    child: SizedBox(
                      child: Text('No hay medicamentos '),
                    ),
                  ));
  }
}
