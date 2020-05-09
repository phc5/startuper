import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideabuilder/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text('Welcome to SETTINGS, ${model.user}'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BusyButton(
                  title: 'Log Out',
                  busy: model.isBusy,
                  onPressed: () {
                    model.logout();
                  },
                ),
                BusyButton(
                  title: 'Delete User',
                  busy: model.isBusy,
                  onPressed: () {
                    _showMyDialog(context, model);
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(context, model) async {
  final passwordController = TextEditingController();

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please enter your password to delete your account.'),
              Text('This is an irreversible action.'),
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Submit'),
            onPressed: () {
              model.deleteUser(passwordController.text);
            },
          ),
        ],
      );
    },
  );
}
