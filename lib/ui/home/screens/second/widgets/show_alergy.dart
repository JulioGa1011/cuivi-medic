import 'package:flutter/material.dart';

import '../../../../models/expedient_model.dart';

class ShowAllergies extends StatefulWidget {
  List<PatientExpedientModel> expedient;
  ShowAllergies({Key? key, required this.expedient}) : super(key: key);

  @override
  State<ShowAllergies> createState() => _ShowAllergiesState();
}

class _ShowAllergiesState extends State<ShowAllergies> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.expedient.first.allergies.length, (index) {
        final exp = widget.expedient.first.allergies[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '-${exp.name!}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 199, 199, 199)),
              )
            ],
          ),
        );
      }),
    );
  }
}
