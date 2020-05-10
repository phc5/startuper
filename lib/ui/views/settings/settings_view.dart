import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/widgets/settings_button.dart';

import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The ViewModelBuilder provides the UI that will be built from the ViewModel
    // .reactive() is called to rebuild the UI every time notifyListeners() is called in ViewModel.
    // can also use .nonreactive() which will build it once and not rebuild on notifyListeners().
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              child: SizedBox(
                height: 190,
                child: Container(
                  color: primaryTextColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 130, 30, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: new Offset(1.0, 2.25),
                  ),
                  BoxShadow(
                    color: Colors.grey[300],
                    offset: new Offset(-1.0, 2.25),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        verticalSpaceMedium,
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                        ),
                        verticalSpaceSmall,
                        spacedDivider,
                        InkWell(
                          onTap: () {
                            model.changeEmail();
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
                                      'Change Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: primaryTextColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: primaryTextColor,
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
                            model.changePassword();
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
                                      'Change Password',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: primaryTextColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: primaryTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        spacedDivider,
                        verticalSpaceMedium,
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: FlatButton(
                            child: Text('Log Out'),
                            color: primaryTextColor,
                            onPressed: () {
                              model.logout();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                        verticalSpaceSmall,
                        Container(
                          height: 50,
                          child: FlatButton(
                            child: Text('Delete Account'),
                            color: Colors.redAccent,
                            onPressed: () {
                              model.deleteAccount();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                        verticalSpaceMedium,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
