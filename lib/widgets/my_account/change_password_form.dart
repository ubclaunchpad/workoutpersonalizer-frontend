import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/user.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_account/custom_form_field.dart';

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

  // TODO: Fix "No Overlay widget exists above EditableText" issue (WP-70)
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Old Password", style: secondaryHeadingStyle),
          const CustomFormField(hintText: "Enter your old password"),
          const Text("New Password", style: secondaryHeadingStyle),
          const CustomFormField(hintText: "Enter your new password"),
          const Text("Confirm New Password", style: secondaryHeadingStyle),
          const CustomFormField(hintText: "Re-enter your new password"),
          ElevatedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              if (_formKey.currentState!.validate()) {
                // Process data.
              }
            },
            child: const Text('SAVE', style: secondaryHeadingStyle),
            style: ElevatedButton.styleFrom(primary: turquoise),
          ),
        ],
      ),
    );
  }
}
