import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_account/change_password_form.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_account/edit_account_form.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  // TODO: Style page (WP-73)
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(children: const [
                Text("Edit Account Details", style: primaryHeadingStyle),
                EditAccountForm()
              ])
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(children: const [
                Text("Change Password", style: primaryHeadingStyle),
                ChangePasswordForm()
              ])
            ),
          )
        ])
      );
  }
}
