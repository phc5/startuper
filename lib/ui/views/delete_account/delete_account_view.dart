import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/views/delete_account/delete_account_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class DeleteAccountView extends StatelessWidget {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeleteAccountViewModel>.reactive(
      viewModelBuilder: () => DeleteAccountViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Account Deactivation',
                style: TextStyle(
                  fontSize: 38,
                  color: primaryTextColor,
                ),
              ),
              verticalSpaceMedium,
              Text(
                'When you deactivate your account, you will be logged out and this account will no longer be usable.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              verticalSpaceSmall,
              Text(
                'Please enter your password to confirm.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: primaryTextColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  BusyButton(
                    title: 'Confirm',
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    busy: model.isBusy,
                    onPressed: () {
                      model.deleteUser(passwordController.text);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
