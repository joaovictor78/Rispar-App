import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/color_palettes.dart';

class CustomInputWiget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  CustomInputWiget(
      {this.validator,
      this.label,
      this.hintText,
      this.hintStyle,
      this.style,
      this.inputFormatters,
      this.keyboardType,
      this.controller,
      this.autovalidateMode});
  String? Function(String?)? validator;
  Widget? label;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? style;
  TextEditingController? controller;
  AutovalidateMode? autovalidateMode;
  @override
  State<CustomInputWiget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWiget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label ?? Container(),
        TextFormField(
            autovalidateMode: widget.autovalidateMode,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            style: widget.style,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorPalettes.lightPrimary, width: 2),
              ),
            )),
      ],
    );
  }
}
