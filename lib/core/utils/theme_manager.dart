import 'package:flutter/material.dart';
import 'color_manager.dart';


ThemeData getAppTheme() {
  return ThemeData(
      fontFamily: 'Abg',
      hintColor: ColorManager.primary,
      hoverColor: ColorManager.primary.withOpacity(.10),
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.white,
      primaryColor: ColorManager.primary,
      );
}
