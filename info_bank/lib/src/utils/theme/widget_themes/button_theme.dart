import 'package:flutter/material.dart';
import 'package:info_bank/src/constants/colors.dart';
import 'package:info_bank/src/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes --*/
class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme --*/
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondColor,
      side: BorderSide(color: tSecondColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  /* -- Dark Theme --*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondColor,
      backgroundColor: tWhiteColor,
      side: BorderSide(color: tSecondColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}

/* -- Light & Dark Outlined Button Themes --*/
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme --*/
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondColor,
      side: BorderSide(color: tSecondColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  /* -- Dark Theme --*/
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
