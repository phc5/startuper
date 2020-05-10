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
        appBar: AppBar(
          backgroundColor: primaryTextColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: primaryBackgroundColor,
        body: ListView(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          children: <Widget>[
            verticalSpaceLarge,
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
                model.changePassword();
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
          ],
        ),
      ),
    );
  }
}
