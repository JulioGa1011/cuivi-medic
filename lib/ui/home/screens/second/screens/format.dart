import 'package:cuivi_medic/widgets/app_bar_widget.dart';
import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class Format extends StatefulWidget {
  const Format({Key? key}) : super(key: key);

  @override
  State<Format> createState() => _FormatState();
}

class _FormatState extends State<Format> {
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
          hintText: 'Parametros clinicos',
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
          hintText: 'Resumen del interrogatorio',
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
          hintText: 'Resultados de estudios de gabinete',
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
          hintText: 'Diagnostico',
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
          hintText: 'Plan o tratamiento',
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
          hintText: 'Pronostico',
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
          hintText: 'nombre, cedula y firma',
          controller: _identityController,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
