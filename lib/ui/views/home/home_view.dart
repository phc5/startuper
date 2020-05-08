import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/home/home_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text(
              'Welcome to home, ${model.user}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
