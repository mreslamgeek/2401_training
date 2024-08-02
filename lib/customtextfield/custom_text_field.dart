import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  final String hint;
  final Icon? prefix;
  final bool obscure;
  final Image? suffix;
  const Custom_Text_Field({
    super.key,
    required this.hint,
    this.prefix,
    this.suffix,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: suffix,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: prefix,
      ),
    );
  }
}
