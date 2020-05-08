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
        backgroundColor: primaryBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 38,
                  color: Colors.white,
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              BusyButton(
                title: 'Reset Password',
                busy: model.isBusy,
                onPressed: () {
                  model.resetPassword(
                    email: emailController.text,
                  );
                },
              ),
              verticalSpaceSmall,
            ],
          ),
        ),
      ),
    );
  }
}
