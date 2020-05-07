import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './startup_viewmodel.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.handleStartUp(),
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color.fromRGBO(28, 28, 44, 1.0),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 150,
              child: Image.asset('assets/startuper.png'),
            ),
            CircularProgressIndicator(
              strokeWidth: 4.0,
              valueColor: AlwaysStoppedAnimation(
                Color.fromRGBO(145, 232, 161, 1.0),
              ),
            )
          ],
        )),
      ),
    );
  }
}
