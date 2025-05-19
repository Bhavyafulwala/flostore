import 'package:flutter/material.dart';
import 'package:mystore/utils/theme/custom_themes/appbar_theme.dart';
import 'package:mystore/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:mystore/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:mystore/utils/theme/custom_themes/chip_theme.dart';
import 'package:mystore/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:mystore/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:mystore/utils/theme/custom_themes/text_field_theme.dart';
import 'package:mystore/utils/theme/custom_themes/text_theme.dart';

class TAppTheme{
  TAppTheme._();

  static ThemeData lighttheme=ThemeData(
    useMaterial3: true,
    fontFamily:'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme:TTextTheme.lighttexttheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme
  );
  static ThemeData darktheme=ThemeData(
      useMaterial3: true,
      fontFamily:'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme:TTextTheme.darktexttheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme




  );
}