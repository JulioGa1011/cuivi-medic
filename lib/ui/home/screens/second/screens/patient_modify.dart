import 'package:cuivi_medic/ui/home/screens/second/widgets/clinic_history.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/params.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/params_patient.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_medicament_patient.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../models/expedient_model.dart';
import '../../third/screens/add_prescription.dart';
import 'alert_screen_format.dart';

class PatientModify extends StatefulWidget {
  List<PatientExpedientModel> expedient;
  int paramId;

  PatientModify({Key? key, required this.expedient, required this.paramId})
      : super(key: key);

  @override
  State<PatientModify> createState() => _PatientModifyState();
}

class _PatientModifyState extends State<PatientModify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      color: const Color.fromARGB(255, 205, 231, 252),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlertScreenFormat(),
                  ),
                );
              },
              icon: const Icon(FontAwesomeIcons.notesMedical)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: const AppBarWidget(
                          isShowBack: true,
                          title: Text(
                            'Medicamentos del paciente',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        body: ShowMedicaments(
                          expedient: widget.expedient,
                          complete: true,
                        ),
                      );
                    });
              },
              icon: const Icon(FontAwesomeIcons.pills)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Params(
                      paramId: widget.paramId,
                    ),
                  ),
                );
              },
              icon: const Icon(FontAwesomeIcons.heartPulse)),
          IconButton(
              onPressed: () {}, icon: const Icon(FontAwesomeIcons.fileMedical)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Scaffold(
                          appBar: AppBarWidget(
                            isShowBack: true,
                            title: Text(
                              'Crear receta',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          body: AddPrescription());
                    });
              },
              icon: const Icon(FontAwesomeIcons.solidClipboard)),
        ],
      ),
    );
  }
}
