import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer.dart';

class SettingsMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SettingsViewModel _model;
  SettingsMobilePortrait(SettingsViewModel model, {Key key})
      : _model = model,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: primaryTextColor,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: primaryBackgroundColor,
      body: Container(
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
                      _model.changeEmail();
                    },
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      _model.changePassword();
                    },
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color: Colors.blueGrey[300],
                      onPressed: () {
                        _model.logout();
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
                        _model.deleteAccount();
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
    );
  }
}

class SettingsMobileLandscape extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final SettingsViewModel _model;
  SettingsMobileLandscape(SettingsViewModel model, {Key key})
      : _model = model,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: primaryBackgroundColor,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppDrawer(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 60, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      verticalSpaceMedium,
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 30,
                          color: primaryTextColor,
                        ),
                      ),
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
                          _model.changeEmail();
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
                          _model.changePassword();
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
                      Container(
                        height: 50,
                        child: FlatButton(
                          child: Text('Log Out'),
                          color: Colors.blueGrey[300],
                          onPressed: () {
                            _model.logout();
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
                            _model.deleteAccount();
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
