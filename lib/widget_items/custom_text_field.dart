import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final MaterialColor color;
  final String? Function(String?)? validatorFunc;
  final void Function(String?)? changedFunc;

  bool obscureText = false;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.color,
    required this.validatorFunc,
    required this.obscureText,
    required this.changedFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: color,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: validatorFunc,
        onChanged: changedFunc,
      ),
    );
  }
}
