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
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondColor,
      side: const BorderSide(color: tSecondColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  /* -- Dark Theme --*/
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondColor,
      backgroundColor: tWhiteColor,
      side: const BorderSide(color: tSecondColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}

/* -- Light & Dark Outlined Button Themes --*/
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme --*/
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tPrimaryColor,
      side: const BorderSide(color: tPrimaryColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  /* -- Dark Theme --*/
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: const BorderSide(color: tWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
