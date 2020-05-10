import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/views/reset_email/reset_email_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class ResetEmailView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetEmailViewModel>.reactive(
      viewModelBuilder: () => ResetEmailViewModel(),
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
                'Change Email',
                style: TextStyle(
                  fontSize: 38,
                  color: primaryTextColor,
                ),
              ),
              verticalSpaceMedium,
              Text(
                'To change your email, enter your new email and password below.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceSmall,
              InputField(
                placeholder: 'Email',
                controller: emailController,
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
                    color: primaryTextColor,
                    busy: model.isBusy,
                    onPressed: () {
                      model.changeEmail(emailController.text,
                          passwordController.text, context);
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
