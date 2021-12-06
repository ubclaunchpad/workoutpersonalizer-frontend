import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class CustomFormField extends StatelessWidget {
  final String? initialValue;
  final String hintText;
  const CustomFormField({Key? key, this.initialValue, required this.hintText}) : super(key: key);

  // TODO: Properly validate fields (WP-71)
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill out this field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
              hintText: hintText, filled: true, fillColor: lightOrange),
          validator: _validateField),
    );
  }
}
