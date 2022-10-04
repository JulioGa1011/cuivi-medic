import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputWidget extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focus;
  Color? color = Colors.white;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Function(String) onSubmitted;
  final Function()? onTap;
  final Function()? onComplete;
  Function(String)? onChange = (val) {};
  final bool? enable;
  final IconData? icon;
  final Widget? iconSuffix;
  final String? hintText;
  final String? Function(String?) validate;
  final bool isPassword;
  final AutovalidateMode autovalidateMode;
  final Function(String?)? onSaved;
  final TextStyle? hintStyle;
  final TextAlign textAlign;
  final int? maxLines;
  final bool autocorrect;

  InputWidget({
    Key? key,
    this.controller,
    this.focus,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.color,
    this.hintStyle,
    this.textInputType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    required this.onSubmitted,
    this.icon,
    this.enable,
    this.hintText,
    required this.validate,
    this.onTap,
    this.onComplete,
    this.onChange,
    this.iconSuffix,
    this.isPassword = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onSaved,
    this.autocorrect = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.indigoAccent,
          ),
          child: Center(
            child: TextFormField(
              autocorrect: widget.autocorrect,
              onSaved: widget.onSaved,
              autovalidateMode: widget.autovalidateMode,
              focusNode: widget.focus,
              maxLines: widget.isPassword ? 1 : widget.maxLines,
              onEditingComplete: widget.onComplete,
              enabled: widget.enable ?? true,
              validator: widget.validate,
              textCapitalization: widget.textCapitalization,
              cursorColor: const Color(0xFF00afef),
              onChanged: widget.onChange,
              keyboardType: widget.textInputType,
              style: const TextStyle(fontFamily: 'Lato'),
              textAlign: widget.textAlign,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              obscureText: widget.isPassword ? !showPassword : false,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      )
                    : null,
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  // height: 0,
                ),
                labelText: widget.hintText,
                labelStyle: widget.hintStyle,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.indigo),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.indigo),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.indigoAccent,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
