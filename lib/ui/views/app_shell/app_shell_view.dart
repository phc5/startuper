import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/busy_button.dart';

class AppShellView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<AppShellViewModel>.reactive(
      viewModelBuilder: () => AppShellViewModel(),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentViewIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
          onTap: (index) {
            model.navigateToIndex(index);
          },
        ),
        body: model.pages[model.currentViewIndex],
      ),
    );
  }
}
