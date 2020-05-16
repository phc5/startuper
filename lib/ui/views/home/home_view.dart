import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/views/home/project_list_item/project_list_item.dart';
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
          onModelReady: (model) => model.listenToProjects(),
          builder: (context, model, child) => Column(
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  if (!model.isBusy) {
                    model.createProject();
                  }
                },
                child: Icon(Icons.add),
              ),
              Expanded(
                  child: model.projects != null
                      ? ListView.builder(
                          itemCount: model.projects.length,
                          itemBuilder: (context, index) => ProjectListItem(
                            project: model.projects[index],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).accentColor),
                        ))),
            ],
          ),
        );
      },
    );
  }
}
