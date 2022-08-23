import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:flutter/material.dart';

class ShowMedicalDiagnostic extends StatefulWidget {
  List<PatientExpedientModel> expedient;
  ShowMedicalDiagnostic({Key? key, required this.expedient}) : super(key: key);

  @override
  State<ShowMedicalDiagnostic> createState() => _ShowMedicalDiagnosticState();
}

class _ShowMedicalDiagnosticState extends State<ShowMedicalDiagnostic> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            widget.expedient.first.medicalDiagnostics.length, (index) {
      final exp = widget.expedient.first.medicalDiagnostics[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '-${exp.name!}  ',
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
            Text(
              exp.diagnosedAt!,
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
          ],
        ),
      );
    }));
  }
}
