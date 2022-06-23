import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomButtonWidget(
      {required this.onPressed,
      required this.enabled,
      required this.title,
      this.padding,
      this.noBackground = false});
  bool enabled;
  void Function()? onPressed;
  bool noBackground;
  String? title;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.only(left: 35, right: 35, bottom: 20),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: enabled ? onPressed : null,
        style: TextButton.styleFrom(
            backgroundColor: noBackground
                ? null
                : enabled
                    ? const Color(0xFF3F9798)
                    : const Color(0xFF7FC0C1),
            padding: const EdgeInsets.symmetric(vertical: 18)),
        child: Text(
          title ?? "",
          style: TextStyle(
              color: noBackground ? const Color(0xFF3F9798) : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
