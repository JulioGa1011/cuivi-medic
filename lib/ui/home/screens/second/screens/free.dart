import 'package:cuivi_medic/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class FreeNote extends StatefulWidget {
  const FreeNote({super.key});

  @override
  State<FreeNote> createState() => _FreeNoteState();
}

class _FreeNoteState extends State<FreeNote> {
  final TextEditingController _identityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputWidget(
        maxLines: 20,
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
        hintText: ' ',
        controller: _identityController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }
}
