import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SettingsTablet extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SettingsViewModel _model;
  SettingsTablet(SettingsViewModel model, {Key key})
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: ListView(
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
            InkWell(
              onTap: () {
                _model.logout();
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
                          'Log Out',
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
                _model.deleteAccount();
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
                          'Deactivate Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.red[400],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.red[400],
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
      ),
    );
  }
}
