import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';

class AppShellView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppShellViewModel>.reactive(
      viewModelBuilder: () => AppShellViewModel(),
      builder: (context, model, child) {
        var size = MediaQuery.of(context).size;
        model.screenHeight = size.height;
        model.screenWidth = size.width;
        return Scaffold(
          body: Stack(
            children: <Widget>[
              menu(context, model),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                top: 0,
                bottom: 0,
                right: model.menuCollapsed ? 0 : -0.5 * model.screenWidth,
                left: model.menuCollapsed ? 0 : 0.5 * model.screenWidth,
                child: Material(
                  animationDuration: Duration(milliseconds: 200),
                  elevation: 20,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Icon(
                                  Icons.menu,
                                ),
                                onTap: () {
                                  model.toggleMenu();
                                },
                              ),
                              Text(
                                model.currentView,
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(width: 24, height: 24),
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print(model.menuCollapsed);
                              if (!model.menuCollapsed) {
                                model.toggleMenu();
                              }
                            },
                            child: PageStorage(
                              child: model.pageViews[model.currentViewIndex],
                              bucket: model.bucket,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget menu(context, AppShellViewModel model) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onTap: () {
                      model.navigateToIndex(0);
                    },
                  ),
                  SizedBox(height: 24),
                  InkWell(
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    onTap: () {
                      model.navigateToIndex(1);
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
            spacedDivider,
          ],
        ),
      ),
    );
  }
}
