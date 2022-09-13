import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class AddAppointment extends StatefulWidget {
  const AddAppointment({super.key});

  @override
  State<AddAppointment> createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  final TextEditingController _identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agregar nueva cita'),
      actions: [
        TextButton(onPressed: () {}, child: Text('Agregar')),
        TextButton(onPressed: () {}, child: Text('Cancelar'))
      ],
      content: Column(
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
            hintText: 'Paciente',
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
            hintText: 'Dia de la cita ',
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
            hintText: 'Hora de la cita',
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
            hintText: 'titulo',
            controller: _identityController,
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
            controller: _identityController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
