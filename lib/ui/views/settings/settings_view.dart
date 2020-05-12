import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ideabuilder/ui/shared/responsive/screen_type_layout.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';
import 'package:ideabuilder/ui/views/settings/settings_view_mobile.dart';
import 'package:ideabuilder/ui/widgets/app_drawer/app_drawer.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:ideabuilder/ui/shared/responsive/orientation_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/settings/settings_viewmodel.dart';
import 'package:ideabuilder/ui/shared/shared_styles.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<SettingsViewModel>.reactive(
          viewModelBuilder: () => SettingsViewModel(),
          builder: (context, model, child) => ScreenTypeLayout(
            mobile: OrientationLayout(
              portrait: SettingsMobilePortrait(model),
              landscape: SettingsMobileLandscape(model),
            ),
//            tablet: SettingsTablet(),
          ),
        );
      },
    );
  }
}
