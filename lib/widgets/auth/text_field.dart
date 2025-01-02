import 'package:flutter/material.dart';
import 'package:myapp/utils/type_def.dart';

class AuthField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isobscure;
  final TextEditingController controller;
  final ValidationCallBack validationCallBack;

  const AuthField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isobscure,
    required this.controller,
    required this.validationCallBack,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validationCallBack,
      controller: widget.controller,
      obscureText: widget.isobscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFF88C49),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
