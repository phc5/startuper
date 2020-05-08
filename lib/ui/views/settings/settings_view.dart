import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
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
              ],
            )
          ]),
        ),
      ),
    );
  }
}
