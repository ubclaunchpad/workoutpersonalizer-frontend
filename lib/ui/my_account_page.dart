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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IntrinsicHeight(
              child:
                Row(
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
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('DELETE ACCOUNT', style: secondaryHeadingStyle),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
            )
          ],
        ),
      );
  }
}
