import 'package:flutter/material.dart';
import 'package:ideabuilder/app/locator.dart';
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
          backgroundColor: Color.fromRGBO(28, 28, 44, 1.0),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/startuper.png'),
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
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    SizedBox(
                      width: 15.0,
                    ),
                    BusyButton(
                        title: 'Sign Up',
                        onPressed: () {
                          model.navigateToSignUp();
                        })
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
