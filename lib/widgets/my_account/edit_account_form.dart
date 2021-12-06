import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/user.dart';

class EditAccountForm extends StatefulWidget {
  const EditAccountForm({Key? key}) : super(key: key);

  @override
  State<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
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

  Widget firstAndLastName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    const Text("First Name"),
                    TextFormField(
                        initialValue: defaultUser.firstName,
                        decoration: const InputDecoration(
                          hintText: 'Enter your first name',
                        ),
                        validator: _validateField),
                  ],
                ))),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    const Text("Last Name"),
                    TextFormField(
                        initialValue: defaultUser.lastName,
                        decoration: const InputDecoration(
                          hintText: 'Enter your last name',
                        ),
                        validator: _validateField),
                  ],
                ))),
    ]));
  }

  // TODO: Fix "No Overlay widget exists above EditableText" issue (WP-70)
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstAndLastName(),
          Text("Email"),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              initialValue: defaultUser.email,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: _validateField),
          ),
          Text("Username"),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              initialValue: defaultUser.username,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
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
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
