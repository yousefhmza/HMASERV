import 'package:flutter/material.dart';
import 'package:hmaserv/core/extensions/num_extensions.dart';

import '../../core/resources/resources.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.white,
    splashColor: AppColors.transparent,

    dialogBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primary, surfaceTint: AppColors.white),

    /// Bottom sheet
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.white),

    /// Appbar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: AppSize.s0,
      scrolledUnderElevation: AppSize.s0,
      iconTheme: IconThemeData(color: AppColors.black),
    ),

    /// Divider theme
    dividerColor: AppColors.grey300,
    dividerTheme: const DividerThemeData(color: AppColors.grey300),

    /// Progress indicator theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.primary),

    /// Icon theme
    iconTheme: const IconThemeData(color: AppColors.black),

    /// Text fields
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.black,
      hintStyle: TextStyle(
        color: AppColors.grey500,
        fontSize: FontSize.s14.sp,
        height: 1,
        fontWeight: FontWeightManager.regular,
        fontFamily: FontConstants.fontFamily,
      ),
      contentPadding: const EdgeInsets.all(AppPadding.p16),
      errorStyle: TextStyle(
        fontSize: FontSize.s10.sp,
        color: AppColors.warning,
        fontFamily: FontConstants.fontFamily,
      ),
      errorMaxLines: 5,
      filled: true,
      fillColor: AppColors.grey300.withOpacity(0.45),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSize.s12.r),
      ),
    ),
  );
}
