import 'package:flutter/material.dart';

import '../../../../../widgets/input_widget.dart';

class ClinicHistory extends StatefulWidget {
  ClinicHistory({Key? key}) : super(key: key);

  @override
  State<ClinicHistory> createState() => _ClinicHistoryState();
}

class _ClinicHistoryState extends State<ClinicHistory> {
  final TextEditingController _identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          hintText: 'Edad',
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
          hintText: 'Sexo',
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
          hintText: 'Antecedentes heredofamiliares',
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
          hintText: 'Antecedentes personales no patológicos',
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
          hintText: 'Antecedentes personales patológicos',
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
          hintText: 'Padecimiento actual',
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
          hintText: 'Interrogatorio por aparatos y sistemas',
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
          hintText: 'Signos vitales',
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
          hintText: 'Exploración física',
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
          hintText: 'Resultados previos y actuales de estudios ',
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
          hintText: 'Terapéutica empleada',
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
          hintText: 'Diagnósticos',
          controller: _identityController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
