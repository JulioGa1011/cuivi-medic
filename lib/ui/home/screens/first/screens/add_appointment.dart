import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/format.dart';
import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/ui/providers/patient_provider.dart';
import 'package:cuivi_medic/ui/services/appointment_services.dart';
import 'package:cuivi_medic/ui/services/patient_services.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  DateTime? date;
  TimeOfDay? start;
  TimeOfDay? end;
  dynamic response;
  List<String> patientListName = ["seleccione un paciente"];
  int? idPatient;
  String? namePatient;
  bool? addPatient = false;

  final TextEditingController _appointment = TextEditingController();
  final TextEditingController _start = TextEditingController();
  final TextEditingController _end = TextEditingController();
  final TextEditingController _patientId = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  PatientModel? selectedItem;
  int? mont;
  int? day;
  var isInit = false;

  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PatientProvider>(context).getPatient(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;
      initializeDateFormatting();

      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final patient = Provider.of<PatientProvider>(context);

    return AlertDialog(
      title: Text('Agregar nueva cita'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        TextButton(
            onPressed: () {
              if (date!.month >= 9) {}
              if (start!.hour >= 9) {
                _start.text = "0${start!.format(context).split(" ").first}";
                setState(() {});
              } else {
                _start.text = start!.format(context).split(" ").first;
                setState(() {});
              }
              if (end!.hour >= 9) {
                _end.text = "0${end!.format(context).split(" ").first}";
                setState(() {});
              } else {
                _end.text = end!.format(context).split(" ").first;
                setState(() {});
              }
              logger.d(
                DateFormat.yMd().format(date!).toString(),
              );

              AppointmentServices().createAppointment(
                  context,
                  date.toString().split(" ").first,
                  _start.text,
                  _end.text,
                  idPatient,
                  _title.text,
                  _description.text);
            },
            child: Text('Agregar')),
      ],
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width * .5,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                    child: DropdownButton<PatientModel>(
                        iconEnabledColor: Color(0xff0F70B7),
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        value: selectedItem,
                        hint: Text(
                          'Elige un paciente', // !
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: size.width * .035,
                          ),
                        ),
                        underline: Container(),
                        items: patient.add.map((PatientModel value) {
                          return DropdownMenuItem<PatientModel>(
                              value: value, child: Text(value.name!));
                        }).toList(),
                        onChanged: (PatientModel? newValue) {
                          selectedItem = newValue;
                          setState(() {
                            idPatient = newValue!.patientId;
                          });
                        }),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addPatient = true;
                    setState(() {});
                  },
                )
              ],
            ),
            const SizedBox(height: 10),
            addPatient!
                ? InputWidget(
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
                    hintText: 'Paciente',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                  )
                : SizedBox(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                setState(() {});
              },
              child: InputWidget(
                textCapitalization: TextCapitalization.sentences,
                icon: Icons.event,
                enable: false,
                hintText: date == null
                    ? 'Fecha'
                    : '${date!.day} de ${DateFormat('MMMM', 'es').format(date!)} de ${date!.year}',
                // : DateFormat('dd-MM-yyyy').format(date!),
                onSubmitted: (value) {},
                validate: (value) {
                  if (date == null) {
                    return 'Selecciona una fecha';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      start = await showCustomTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        helpText: 'Hora de inicio',
                      );
                      end = null;
                      setState(() {});
                    },
                    child: InputWidget(
                      hintText:
                          start == null ? 'Inicio' : start!.format(context),
                      enable: false,
                      // icon: Icons.schedule,
                      onSubmitted: (value) {},
                      validate: (value) {
                        if (start == null) {
                          return 'Selecciona la hora de inicio';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (start != null) {
                        end = await showCustomTimePicker(
                          context: context,
                          initialTime: start!,
                          helpText: 'Hora de termino',
                          onFailValidation: (ctx) {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  content: const Text(
                                    'Selecciona una hora después de la hora de comienzo',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          selectableTimePredicate: (time) {
                            final now = DateTime.now();
                            final startTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              start!.hour,
                              start!.minute,
                            );
                            final selectedTime = DateTime(
                              now.year,
                              now.month,
                              now.day,
                              time!.hour,
                              time.minute,
                            );

                            if (selectedTime.isBefore(startTime)) {
                              return false;
                            }
                            return true;
                          },
                        );

                        setState(() {});
                      }
                    },
                    child: InputWidget(
                      hintText: end == null ? 'Termino' : end!.format(context),
                      enable: false,
                      onSubmitted: (value) {},
                      validate: (value) {
                        if (end == null) {
                          return 'Selecciona la hora de inicio';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
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
              hintText: 'titulo',
              controller: _title,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            InputWidget(
              maxLines: 10,
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
              hintText: 'Descripcion',
              controller: _description,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
