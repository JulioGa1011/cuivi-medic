import 'package:cuivi_medic/ui/home/screens/second/widgets/parameter.dart';
import 'package:cuivi_medic/ui/models/clinic_history.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../../widgets/input_widget.dart';
import '../screens/format.dart';

class ClinicHistory extends StatefulWidget {
  int patientId;
  ClinicHistory({Key? key, required this.patientId}) : super(key: key);

  @override
  State<ClinicHistory> createState() => _ClinicHistoryState();
}

class _ClinicHistoryState extends State<ClinicHistory> {
  final TextEditingController _identityController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _recordH = TextEditingController();
  final TextEditingController _recordP = TextEditingController();
  final TextEditingController _recordPp = TextEditingController();
  final TextEditingController _currentCondition = TextEditingController();
  final TextEditingController _interrogation = TextEditingController();
  final TextEditingController _vitalSigns = TextEditingController();
  final TextEditingController _physicalExploration = TextEditingController();
  final TextEditingController _results = TextEditingController();
  final TextEditingController _therapeutic = TextEditingController();
  final TextEditingController _diagnostic = TextEditingController();

  @override
  Widget build(BuildContext context) {
    submit() {}
    return Column(
      children: [
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Ficha de identificación',
          controller: _identityController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Nombre ',
          controller: _name,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Edad',
          controller: _age,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Sexo',
          controller: _gender,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Antecedentes heredofamiliares',
          controller: _recordH,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Antecedentes personales no patológicos',
          controller: _recordP,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Antecedentes personales patológicos',
          controller: _recordPp,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Padecimiento actual',
          controller: _currentCondition,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Interrogatorio por aparatos y sistemas',
          controller: _interrogation,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        // InputWidget(
        //   onSaved: (p0) {},
        //   autovalidateMode: AutovalidateMode.onUserInteraction,
        //   onSubmitted: (text) {},
        //   textCapitalization: TextCapitalization.none,
        //   validate: (text) {
        //     if (text!.trim().isEmpty) {
        //       return 'Este campo es requerido';
        //     }
        //     return null;
        //   },
        //   hintText: 'Signos vitales',
        //   controller: _vitalSigns,
        //   textInputAction: TextInputAction.next,
        //   textInputType: TextInputType.emailAddress,
        // ),

        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Exploración física',
          controller: _physicalExploration,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Resultados previos y actuales de estudios ',
          controller: _results,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Terapéutica empleada',
          controller: _therapeutic,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        InputWidget(
          onSaved: (p0) {},
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSubmitted: (text) {},
          textCapitalization: TextCapitalization.none,
          validate: (text) {
            if (text!.trim().isEmpty) {
              return 'Este campo es requerido';
            }
            return null;
          },
          hintText: 'Diagnósticos',
          controller: _diagnostic,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text('Signos vitales'),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ParametersModal();
                      });
                },
                icon: Icon(Icons.add))
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                _identityController.clear();
                _name.clear();
                _age.clear();
                _gender.clear();
                _recordH.clear();
                _recordP.clear();
                _recordPp.clear();
                _currentCondition.clear();
                _interrogation.clear();
                _vitalSigns.clear();
                _physicalExploration.clear();
                _results.clear();
                _therapeutic.clear();
                _diagnostic.clear();
                // clinicHistory(patientId: widget
                // .patientId, data: , type: type)
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return const Format();
                //     });
                // // Navigator.of(context).pop(
                // //   MaterialPageRoute(
                // //     builder: (context) => const Format(),
                // //   ),
                // // );
                // logger.d('aceptar');
              },
            ),
          ],
        )
      ],
    );
  }
}
