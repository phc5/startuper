import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './home_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text('Welcome to home, ${model.user}'),
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
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
