import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/reset_password/reset_password_viewmodel.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class ResetPasswordView extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPasswordViewModel>.reactive(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceMedium,
              Text(
                'To change your password, enter your email below. An email will be sent that incldues a link to change your password.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Cancel',
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  BusyButton(
                    title: 'Confirm',
                    busy: model.isBusy,
                    onPressed: () {
                      model.resetPassword(
                        email: emailController.text,
                      );
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
