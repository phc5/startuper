import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ideabuilder/services/theme_manager.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/views/app_shell/app_shell_viewmodel.dart';
import 'package:ideabuilder/ui/views/settings/settings_row.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SettingsView extends StatelessWidget {
  final AppShellViewModel appShellViewModel;
  const SettingsView({Key key, this.appShellViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<SettingsViewModel>.reactive(
          viewModelBuilder: () => SettingsViewModel(),
          builder: (context, model, child) => Container(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                /// GENERAL
                Text(
                  'General',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                verticalSpaceSmall,
                spacedDivider,
                InkWell(
                  onTap: () {
                    model.changeTheme();
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
                              'Themes',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                spacedDivider,
                verticalSpaceLarge,

                /// ACCOUNT
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                verticalSpaceSmall,
                spacedDivider,
                SettingsRow('Change Email', model.changeEmail),
                spacedDivider,
                SettingsRow('Change Password', model.changePassword),
                spacedDivider,
                SettingsRow('Log Out', model.logout),
                spacedDivider,
                SettingsRow(
                  'Deactivate Account',
                  model.deleteAccount,
                  color: Colors.red[400],
                ),
                spacedDivider,
              ],
            ),
          ),
        );
      },
    );
  }
}
