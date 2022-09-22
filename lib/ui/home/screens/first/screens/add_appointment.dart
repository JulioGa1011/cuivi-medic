import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final TextEditingController _appointment = TextEditingController();
  final TextEditingController _start = TextEditingController();
  final TextEditingController _end = TextEditingController();
  final TextEditingController _patientId = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  PatientModel? selectedItem;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      title: Text('Agregar nueva cita'),
      actions: [
        TextButton(onPressed: () {}, child: Text('Agregar')),
        TextButton(onPressed: () {}, child: Text('Cancelar'))
      ],
      content: Column(
        children: [
          Container(
                        width: size.width * .7,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .03),
                          /* DropdownButton<PatientModel>(
                              iconEnabledColor: Color(0xff0F70B7),
                              borderRadius: BorderRadius.circular(10),
                              isExpanded: true,
                              value: selectedItem,
                              hint: Text(
                                'Elige el área', // !
                                style: TextStyle(
                                  color: 
                                      Colors.black54,
                                  fontSize: size.width * .035,
                                ),
                              ),
                              underline: Container(),
                              items: areaList.map((AreaModel value) {
                                return DropdownMenuItem<AreaModel>(
                                    value: value, child: Text(value.name));
                              }).toList(),
                              onChanged: (AreaModel newValue) {
                                //selectedItem = newValue;
                                //setState(() {});
                              }
                              ),
                              */
                              
                        ),
                      ),
          const SizedBox(height: 10),
           GestureDetector(
                      onTap: () async {
                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
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
                              hintText: start == null
                                  ? 'Inicio'
                                  : start!.format(context),
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
                              hintText: end == null
                                  ? 'Termino'
                                  : end!.format(context),
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
    );
  }
}
