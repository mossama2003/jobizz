import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_size.dart';

EdgeInsetsGeometry paddingForm = AppSize.padding(horizontal: 20, vertical: 12);

TextStyle textForm = TextStyle(
  color: AppColors.darkGray,
  fontSize: AppSize.font(14),
  fontWeight: FontWeight.w300,
);

TextStyle hintForm = TextStyle(
  fontSize: AppSize.font(14),
  fontWeight: FontWeight.w300,
);

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: AppColors.white),
  borderRadius: BorderRadius.circular(AppSize.getSize(30)),
);

InputDecorationTheme textFormTheme = InputDecorationTheme(
  filled: true,
  hintStyle: hintForm,
  border: inputBorder,
  labelStyle: textForm,
  helperStyle: textForm,
  fillColor: AppColors.white,
  focusedBorder: inputBorder,
  enabledBorder: inputBorder,
  disabledBorder: inputBorder,
  contentPadding: paddingForm,
);

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  centerTitle: false,
  titleTextStyle: TextStyle(
    color: AppColors.white,
    fontFamily: 'TTNormsPro',
    fontWeight: FontWeight.bold,
    fontSize: AppSize.font(14),
  ),
  backgroundColor: AppColors.primaryColor,
  iconTheme: const IconThemeData(color: AppColors.white),
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.primaryColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
);

BottomSheetThemeData bottomSheetTheme = BottomSheetThemeData(
  modalBackgroundColor: AppColors.scaffold,
  modalBarrierColor: AppColors.black.withOpacity(.1),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.only(
      topEnd: Radius.circular(AppSize.getSize(24)),
      topStart: Radius.circular(AppSize.getSize(24)),
    ),
  ),
);

class AppTheme {
  /// LIGHT THEME
  static ThemeData light = ThemeData(
    useMaterial3: false,
    fontFamily: 'TTNormsPro',
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.scaffold,
    appBarTheme: appBarTheme,
    bottomSheetTheme: bottomSheetTheme,
    inputDecorationTheme: textFormTheme,
  );
}
