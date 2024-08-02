import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Icon? prefix;
  final bool obscure;
  final Image? suffix;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  const CustomTextField({
    super.key,
    required this.hint,
    this.prefix,
    this.suffix,
    required this.obscure,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: prefix,
      ),
    );
  }
}
