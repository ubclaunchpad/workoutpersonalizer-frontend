import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/user.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_account/custom_form_field.dart';

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

  Widget firstAndLastName() {
    return Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Column(
                children: [
                  const Text("First Name", style: h2),
                  CustomFormField(
                    initialValue: defaultUser.firstName,
                    hintText: "Enter your first name"
                  ),
                ],
              ))),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  const Text("Last Name", style: h2),
                  CustomFormField(
                    initialValue: defaultUser.lastName,
                    hintText: "Enter your last name"
                  ),
                ],
              ))),
    ]);
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
          const Text("Email", style: h2),
          CustomFormField(
            initialValue: defaultUser.email,
            hintText: "Enter your email"
          ),
          const Text("Username", style: h2),
          CustomFormField(
            initialValue: defaultUser.username,
            hintText: "Enter your username"
          ),
          ElevatedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: const Text('SAVE', style: h2),
            style: ElevatedButton.styleFrom(primary: turquoise),
          ),
        ],
      ),
    );
  }
}
