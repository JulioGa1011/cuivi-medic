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
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text("Agregar nota", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
