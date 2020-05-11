import 'package:flutter/cupertino.dart';
import 'package:ideabuilder/enums/devce_screen_type.dart';

class ScreenSizeInformation {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  ScreenSizeInformation({
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'DeviceScreenType:: $deviceScreenType;; ScreenSize:: $screenSize;; LocalWidgetSize:: $localWidgetSize;;';
  }
}
