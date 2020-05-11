import 'package:flutter/material.dart';
import 'package:ideabuilder/ui/shared/responsive/screen_size_information.dart';
import 'package:ideabuilder/ui/shared/ui_helpers.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
          BuildContext context, ScreenSizeInformation screenSizeInformation)
      builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        var screenSizeInformation = ScreenSizeInformation(
            deviceScreenType: getDeviceType(mediaQuery),
            screenSize: mediaQuery.size,
            localWidgetSize:
                Size(boxConstraints.maxWidth, boxConstraints.maxHeight));
        return builder(context, screenSizeInformation);
      },
    );
  }
}
