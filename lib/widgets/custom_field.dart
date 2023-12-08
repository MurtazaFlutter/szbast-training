import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  const CustomField({
    super.key,
    required this.hintText,
    this.onTap,
    this.suffixIcon = Icons.warning,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
