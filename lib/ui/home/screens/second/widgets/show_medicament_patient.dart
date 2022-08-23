import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:flutter/material.dart';

class ShowMedicaments extends StatefulWidget {
  List<PatientExpedientModel> expedient;
  ShowMedicaments({Key? key, required this.expedient}) : super(key: key);

  @override
  State<ShowMedicaments> createState() => _ShowMedicamentsState();
}

class _ShowMedicamentsState extends State<ShowMedicaments> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children:
            List.generate(widget.expedient.first.medicaments.length, (index) {
      final exp = widget.expedient.first.medicaments[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '-${exp.name ?? ''}',
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
            Text(
              'durante ${exp.days ?? ''} dias',
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
            Text(
              'cada ${exp.hours ?? ''} Hrs.',
              style: const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
            ),
          ],
        ),
      );
    }));
  }
}
