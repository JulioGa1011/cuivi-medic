import 'package:cuivi_medic/ui/models/medical_notes_model.dart';
import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../main.dart';
import '../../../../models/vital_sign_model.dart';
import '../../../../providers/parameterListProvider.dart';
import '../../../../services/notes_services.dart';

class Format extends StatefulWidget {
  int patientId;
  String? name;
  int? id;
  Format({Key? key, this.name, this.id, required this.patientId})
      : super(key: key);

  @override
  State<Format> createState() => _FormatState();
}

class _FormatState extends State<Format> {
  final TextEditingController _identityController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _interrogation = TextEditingController();
  final TextEditingController _physicalExploration = TextEditingController();
  final TextEditingController _results = TextEditingController();
  final TextEditingController _diagnostic = TextEditingController();
  final TextEditingController _treatment = TextEditingController();
  final TextEditingController _pronostic = TextEditingController();
  final TextEditingController _nameDoctor = TextEditingController();
  final TextEditingController _idDoctor = TextEditingController();
  final TextEditingController _signature = TextEditingController();

  final TextEditingController _currentCondition = TextEditingController();
  final TextEditingController _therapeutic = TextEditingController();
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
          hintText: 'Resumen del interrogatorio',
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
          hintText: 'Resultados de estudios de gabinete',
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
          hintText: 'Diagnostico',
          controller: _diagnostic,
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
          hintText: 'Plan o tratamiento',
          controller: _treatment,
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
          hintText: 'Pronostico',
          controller: _pronostic,
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
          hintText: 'Nombre del doctor',
          controller: _nameDoctor,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
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
          hintText: 'Cedula',
          controller: _idDoctor,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
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
          hintText: 'Firma',
          controller: _signature,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
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
                final json = MedicalNotes(
                    patientId: widget.patientId,
                    type: 'Historia clinica',
                    data: Data(
                      name: _name.text,
                      age: int.parse(_age.text),
                      gender: _gender.text,
                      interrogation: _interrogation.text,
                      physicalExploration: _physicalExploration.text,
                      results: _results.text,
                      diagnostic: _diagnostic.text,
                      treatment: _treatment.text,
                      pronostic: _pronostic.text,
                      nameDoctor: _nameDoctor.text,
                      identificationCard: _idDoctor.text,
                      signature: _signature.text,
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
