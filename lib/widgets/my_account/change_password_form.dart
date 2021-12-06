import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/user.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: key);

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TODO: Use user from BE (WP-72)
  User defaultUser =
      User("123", "Rob", "Boss", "robboss123", "robboss123@gmail.com");

  // TODO: Properly validate fields (WP-71)
  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill out this field';
    }
    return null;
  }

  // TODO: Fix "No Overlay widget exists above EditableText" issue (WP-70)
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Old Password"),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your old password',
              ),
              validator: _validateField),
          ),
          Text("New Password"),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your new password',
              ),
              validator: _validateField),
          ),
          Text("Confirm New Password"),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Re-enter your new password',
              ),
              validator: _validateField),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
