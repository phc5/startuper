import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ideabuilder/services/theme_manager.dart';
import 'package:ideabuilder/ui/shared/theme.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'change_theme_viewmodel.dart';

class ChangeThemeView extends StatelessWidget {
  final AppShellViewModel appShellViewModel;
  const ChangeThemeView({Key key, this.appShellViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    var currentTheme = themeNotifier.getTheme();
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<ChangeThemeViewModel>.reactive(
          viewModelBuilder: () => ChangeThemeViewModel(),
          builder: (context, model, child) => Material(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                            Icons.arrow_back,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Text(
                          'Change Theme',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 24, height: 24),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      children: <Widget>[
                        Text(
                          'Themes',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        verticalSpaceSmall,
                        spacedDivider,
                        InkWell(
                          onTap: () {
                            themeNotifier.setTheme(lightTheme);
                          },
                          child: SizedBox(
                            height: 50,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Light Theme',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      currentTheme == lightTheme
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacedDivider,
                        InkWell(
                          onTap: () {
                            themeNotifier.setTheme(darkTheme);
                          },
                          child: SizedBox(
                            height: 50,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Dark Theme',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      currentTheme == darkTheme
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacedDivider,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
