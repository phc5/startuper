import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final AppShellViewModel appShellViewModel;
  const HomeView({Key key, this.appShellViewModel}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          builder: (context, model, child) => Row(
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  model.updateCounter();
                },
                child: Icon(Icons.add),
              ),
              Text(
                '${model.counter}',
              ),
            ],
          ),
        );
      },
    );
  }
}
