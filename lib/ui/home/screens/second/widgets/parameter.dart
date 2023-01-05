import 'package:cuivi_medic/ui/models/medical_notes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_file.dart';

import '../../../../providers/parameterListProvider.dart';
import '../../../../services/parameterListservices.dart';

class ParametersModal extends StatefulWidget {
  String? name;
  int? id;
  ParametersModal({Key? key, this.name, this.id}) : super(key: key);

  @override
  State<ParametersModal> createState() => _ParametersModalState();
}

class _ParametersModalState extends State<ParametersModal> {
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

  Future submit() async {
    // VitalSign array;
    // // array = VitalSign(value: int.parse(paramValue.toString()), clinicalParamId: parameter, id: );
    // return array;
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // setState(() {
    //   isLoading = true;
    // });
    // _formKey.currentState!.save();
    // final finalDate = DateTime(
    //   date!.year,
    //   date!.month,
    //   date!.day,
    //   time!.hour,
    //   time!.minute,
    // );
    // await ParametersListService().postParameter(
    //   clinicalParamId: parameter!,
    //   value: paramValue.toString(),
    //   date: finalDate.toString(),
    //   context: context,
    // );
    // setState(() {
    //   isLoading = false;
    // });
    // Provider.of<ParametersListProvider>(
    //   context,
    //   listen: false,
    // ).setLoading(true);
    // await Provider.of<ExistingParamsProvider>(
    //   context,
    //   listen: false,
    // ).getValues(context);
    // Provider.of<ParametersListProvider>(
    //   context,
    //   listen: false,
    // ).setLoading(false);
    Navigator.pop(context);
  }

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

    return AlertDialog(
      title: const Text('Agregar nuevo parametro'),
      content: isLoading
          ? const SizedBox(
              height: 100,
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    widget.name != null
                        ? Text(
                            widget.name!,
                            style: const TextStyle(fontSize: 18),
                          )
                        : DropdownButtonFormField<Object>(
                            isExpanded: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null) {
                                return 'Seleccione un parametro';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              parameter = int.parse(value.toString());
                            },
                            items: parametersListProvider.parameters.map((e) {
                              return DropdownMenuItem(
                                value: e.id,
                                child: Text(
                                  e.name,
                                  overflow: TextOverflow.visible,
                                  maxLines: 2,
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                parameter = int.parse(value.toString());
                              });

                              minValue =
                                  parametersListProvider.parameters.firstWhere(
                                (e) {
                                  return e.id == int.parse(value.toString());
                                },
                              ).minimumValue!;
                              maxValue =
                                  parametersListProvider.parameters.firstWhere(
                                (e) {
                                  return e.id == int.parse(value.toString());
                                },
                              ).maximumValue!;
                              unity =
                                  parametersListProvider.parameters.firstWhere(
                                (e) {
                                  return e.id == int.parse(value.toString());
                                },
                              ).unitMeasure!;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Seleccione un parametro',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.monitor_heart_outlined),
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
                                    decoration: const InputDecoration(
                                      labelText: 'Valor',
                                      border: OutlineInputBorder(),
                                      // prefixIcon: Icon(Icons.add),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onSaved: (value) {
                                      value1 = (value!);
                                    },
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
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
                                    decoration: const InputDecoration(
                                      labelText: 'Valor',
                                      border: OutlineInputBorder(),
                                      // prefixIcon: Icon(Icons.add),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onSaved: (value) {
                                      value2 = (value!);
                                      if (value1 != null && value2 != null) {
                                        setState(() {
                                          paramValue = '$value1/$value2';
                                        });
                                      }
                                    },
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return 'Ingrese un valor';
                                      }
                                      paramValue = '$value1/$value2';

                                      return null;
                                    },
                                  ),
                                ),
                              ])
                            : Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Valor',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.add),
                                  ),
                                  onSaved: (value) {
                                    paramValue = (value!);
                                  },
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
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
                                  const SizedBox(width: 10),
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
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
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
                              : DateFormat('dd/MMMM/yyyy', 'es').format(date!),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: const TextStyle(color: Colors.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.calendar_today),
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
                          labelText:
                              time == null ? 'Hora' : time!.format(context),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          errorStyle: const TextStyle(color: Colors.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.access_time),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      actions: !isLoading
          ? [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  submit();
                },
                child: const Text('Agregar'),
              ),
            ]
          : null,
    );
  }
}
