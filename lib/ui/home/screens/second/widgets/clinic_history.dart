import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/clinic_history.dart';
import 'package:cuivi_medic/ui/models/vital_sign_model.dart';
import 'package:cuivi_medic/ui/services/notes_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../widgets/input_widget.dart';
import '../../../../providers/parameterListProvider.dart';

class ClinicHistory extends StatefulWidget {
  int patientId;
  String? name;
  int? id;
  ClinicHistory({Key? key, required this.patientId, this.id, this.name})
      : super(key: key);

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
  List<VitalSign> vitalSign = [];
  int? parameter;
  String? paramValue;
  DateTime? date;
  TimeOfDay? time;
  String? value1;
  String? value2;

  String minValue = '0';
  String maxValue = '0';
  String unity = '';

  var isLoading = false;

  final _formKey = GlobalKey<FormState>();
  var isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<ParametersListProvider>(context)
          .getParameters(context)
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null)
      setState(() {
        parameter = widget.id;
      });
    final parametersListProvider = Provider.of<ParametersListProvider>(context);
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
                        return AlertDialog(
                            title: const Text('Agregar nuevo parametro'),
                            content: isLoading
                                ? const SizedBox(
                                    height: 100,
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : SingleChildScrollView(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          widget.name != null
                                              ? Text(
                                                  widget.name!,
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                )
                                              : DropdownButtonFormField<Object>(
                                                  isExpanded: true,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  validator: (value) {
                                                    if (value == null) {
                                                      return 'Seleccione un parametro';
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (value) {
                                                    parameter = int.parse(
                                                        value.toString());
                                                  },
                                                  items: parametersListProvider
                                                      .parameters
                                                      .map((e) {
                                                    return DropdownMenuItem(
                                                      value: e.id,
                                                      child: Text(
                                                        e.name,
                                                        overflow: TextOverflow
                                                            .visible,
                                                        maxLines: 2,
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      parameter = int.parse(
                                                          value.toString());
                                                    });

                                                    minValue =
                                                        parametersListProvider
                                                            .parameters
                                                            .firstWhere(
                                                      (e) {
                                                        return e.id ==
                                                            int.parse(value
                                                                .toString());
                                                      },
                                                    ).minimumValue!;
                                                    maxValue =
                                                        parametersListProvider
                                                            .parameters
                                                            .firstWhere(
                                                      (e) {
                                                        return e.id ==
                                                            int.parse(value
                                                                .toString());
                                                      },
                                                    ).maximumValue!;
                                                    unity =
                                                        parametersListProvider
                                                            .parameters
                                                            .firstWhere(
                                                      (e) {
                                                        return e.id ==
                                                            int.parse(value
                                                                .toString());
                                                      },
                                                    ).unitMeasure!;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText:
                                                        'Seleccione un parametro',
                                                    border:
                                                        OutlineInputBorder(),
                                                    prefixIcon: Icon(Icons
                                                        .monitor_heart_outlined),
                                                  ),
                                                ),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: [
                                              parameter == 8
                                                  ? Row(children: [
                                                      Container(
                                                        width: 70,
                                                        child: TextFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: 'Valor',
                                                            border:
                                                                OutlineInputBorder(),
                                                            // prefixIcon: Icon(Icons.add),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          onSaved: (value) {
                                                            value1 = (value!);
                                                          },
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Ingrese un valor';
                                                            }

                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        '/',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Container(
                                                        width: 70,
                                                        child: TextFormField(
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: 'Valor',
                                                            border:
                                                                OutlineInputBorder(),
                                                            // prefixIcon: Icon(Icons.add),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          onSaved: (value) {
                                                            value2 = (value!);
                                                            if (value1 !=
                                                                    null &&
                                                                value2 !=
                                                                    null) {
                                                              setState(() {
                                                                paramValue =
                                                                    '$value1/$value2';
                                                              });
                                                            }
                                                          },
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty) {
                                                              return 'Ingrese un valor';
                                                            }
                                                            paramValue =
                                                                '$value1/$value2';

                                                            return null;
                                                          },
                                                        ),
                                                      ),
                                                    ])
                                                  : Expanded(
                                                      child: TextFormField(
                                                        decoration:
                                                            const InputDecoration(
                                                          labelText: 'Valor',
                                                          border:
                                                              OutlineInputBorder(),
                                                          prefixIcon:
                                                              Icon(Icons.add),
                                                        ),
                                                        onSaved: (value) {
                                                          paramValue = (value!);
                                                        },
                                                        validator: (value) {
                                                          if (value!
                                                              .trim()
                                                              .isEmpty) {
                                                            return 'Ingrese un valor';
                                                          }

                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                              parameter == null
                                                  ? const SizedBox()
                                                  : Row(
                                                      children: [
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(unity),
                                                      ],
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          GestureDetector(
                                            onTap: () async {
                                              date = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2022),
                                                lastDate: DateTime.now().add(
                                                    const Duration(days: 365)),
                                              );
                                              setState(() {});
                                            },
                                            child: TextFormField(
                                              enabled: false,
                                              validator: (_) {
                                                if (date == null) {
                                                  return 'Seleccione una fecha';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: date == null
                                                    ? 'Fecha'
                                                    : DateFormat('dd/MMMM/yyyy',
                                                            'es')
                                                        .format(date!),
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border:
                                                    const OutlineInputBorder(),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                errorStyle: const TextStyle(
                                                    color: Colors.red),
                                                errorBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                prefixIcon: const Icon(
                                                    Icons.calendar_today),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          GestureDetector(
                                            onTap: () async {
                                              time = await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              );
                                              setState(() {});
                                            },
                                            child: TextFormField(
                                              enabled: false,
                                              validator: (_) {
                                                if (time == null) {
                                                  return 'Seleccione una hora';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: time == null
                                                    ? 'Hora'
                                                    : time!.format(context),
                                                labelStyle: const TextStyle(
                                                    color: Colors.grey),
                                                border:
                                                    const OutlineInputBorder(),
                                                disabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                errorStyle: const TextStyle(
                                                    color: Colors.red),
                                                errorBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                prefixIcon: const Icon(
                                                    Icons.access_time),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final finalDate = DateTime(
                                    date!.year,
                                    date!.month,
                                    date!.day,
                                    time!.hour,
                                    time!.minute,
                                  );
                                  vitalSign.add(VitalSign(
                                      value: paramValue.toString(),
                                      clinicalParamId: parameter,
                                      date: finalDate.toString()));
                                  setState(() {
                                    parameter = null;
                                    date = null;
                                    paramValue = null;
                                    time = null;
                                  });
                                  Navigator.pop(context);
                                },
                                child: const Text('Agregar'),
                              ),
                            ]);
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
                final json = ClinicHistoryModel(
                    patientId: widget.patientId,
                    type: 'Historia clínica',
                    data: Data(
                      identificationFile: _identityController.text,
                      name: _name.text,
                      age: int.parse(_age.text),
                      gender: _gender.text,
                      recordH: _recordH.text,
                      recordP: _recordP.text,
                      recordPp: _recordPp.text,
                      currentCondition: _currentCondition.text,
                      interrogation: _interrogation.text,
                      physicalExploration: _physicalExploration.text,
                      result: _results.text,
                      therapeutic: _therapeutic.text,
                      diagnostic: _diagnostic.text,
                      vitalSign: vitalSign,
                    ));
                NotesServices().createNote(context, json);
                logger.d(vitalSign.length);
                // _identityController.clear();
                // _name.clear(); |1
                // _age.clear();
                // _gender.clear();
                // _recordH.clear();
                // _recordP.clear();
                // _recordPp.clear();
                // _currentCondition.clear();
                // _interrogation.clear();
                // _vitalSigns.clear();
                // _physicalExploration.clear();
                // _results.clear();
                // _therapeutic.clear();
                // _diagnostic.clear();
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
                logger.d(json.toJson());
              },
            ),
          ],
        )
      ],
    );
  }
}
