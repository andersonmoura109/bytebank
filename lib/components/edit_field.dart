import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  const EditField({
    required this.controller,
    this.label,
    this.hint,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.all(5),
            child: icon != null
                ? Icon(
                    icon,
                    size: 32.0,
                  )
                : null,
          ),
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
