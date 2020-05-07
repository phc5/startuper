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
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Startup View'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.navigateToHome();
          },
          child: Icon(Icons.add),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
