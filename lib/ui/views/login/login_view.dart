import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/views/login/login_viewmodel.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:ideabuilder/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: primaryBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/startuper.png'),
                verticalSpaceMedium,
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
                BusyButton(
                  title: 'Login',
                  busy: model.isBusy,
                  onPressed: () {
                    model.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                verticalSpaceSmall,
                TextLink(
                  'Forgot your password?',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: primaryTextColor,
                  ),
                  onPressed: () {
                    model.navigateToResetPassword();
                  },
                ),
                verticalSpaceSmall,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextLink(
                      'Sign up',
                      textStyle: TextStyle(
                        color: primaryTextColor,
                      ),
                      onPressed: () {
                        model.navigateToSignUp();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
