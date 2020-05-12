import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/signup/signup_viewmodel.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/widgets/text_link.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                  color: primaryTextColor,
                ),
              ),
              verticalSpaceMedium,
              InputField(
                placeholder: 'Full Name',
                controller: fullNameController,
              ),
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
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceSmall,
              BusyButton(
                title: 'Sign Up',
                color: primaryTextColor,
                busy: model.isBusy,
                onPressed: () {
                  model.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    fullName: fullNameController.text,
                  );
                },
              ),
              verticalSpaceSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextLink(
                    'Log in',
                    textStyle: TextStyle(
                      color: primaryTextColor,
                    ),
                    onPressed: () {
                      model.navigateToLogin();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
