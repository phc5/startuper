import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: model.updateCounter,
          child: Icon(Icons.add),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
