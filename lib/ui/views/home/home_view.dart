import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/responsive/orientation_layout.dart';
import 'package:ideabuilder/ui/shared/responsive/screen_type_layout.dart';
import 'package:ideabuilder/ui/widgets/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:ideabuilder/ui/views/home/home_viewmodel.dart';
import 'package:ideabuilder/ui/views/home/home_view_mobile.dart';
import 'package:ideabuilder/ui/views/home/home_view_tablet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenSizeInformation) {
        return ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          builder: (context, model, child) => ScreenTypeLayout(
            mobile: OrientationLayout(
              portrait: HomeMobilePortrait(model),
              landscape: HomeMobileLandscape(model),
            ),
            tablet: HomeTablet(),
          ),
        );
      },
    );
  }
}
