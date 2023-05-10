import 'dart:io';

import 'package:app/constants/constants.dart';
import 'package:app/utils/preferences.dart' as preferences;
import 'package:app/utils/full_width_slider_track_shape.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    splashColor: preferences.themeColors.highlightAccent,
    dividerColor: Colors.white30,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.dark(
      background: preferences.themeColors.background,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: preferences.themeColors.black.withOpacity(.3),
      shape: Platform.isIOS
          ? SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 32,
                cornerSmoothing: .5,
              ),
            )
          : null,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
    ),
    popupMenuTheme: PopupMenuThemeData(
      shadowColor: Colors.transparent,
      elevation: 0,
      color: const Color(0xFF1B0047),
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 8,
          cornerSmoothing: .5,
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.white70,
      inactiveTrackColor: Colors.white30,
      thumbColor: Colors.white,
      trackHeight: 3,
      overlayColor: Colors.white30,
      trackShape: FullWidthSliderTrackShape(),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
    ),

    /// Text with a color that contrasts with the card and canvas colors.
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          displayLarge: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 96,
          ),
          displayMedium: const TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 60,
          ),
          displaySmall: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 48,
          ),
          headlineMedium: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 34,
          ),
          headlineSmall: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          titleLarge: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          titleMedium: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          titleSmall: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          bodyLarge: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white24,
          ),
          bodySmall: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          labelLarge: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          labelSmall: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
          ),
        )
        .apply(
          displayColor: preferences.themeColors.text,
          bodyColor: preferences.themeColors.text,
        ),

    // The default theme for ElevatedButton widgets.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: AppDimensions.inputBorderRadius,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(preferences.themeColors.highlight),
        foregroundColor: MaterialStateProperty.all(preferences.themeColors.white),
        overlayColor: MaterialStateProperty.all(preferences.themeColors.highlightAccent),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(AppDimensions.inputPadding),
      ),
    ),

    // The default theme for OutlinedButton widgets.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: preferences.themeColors.text,
        side: const BorderSide(color: Colors.white54),
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.inputBorderRadius,
        ),
        padding: AppDimensions.inputPadding,
      ),
    ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white24),
          contentPadding: AppDimensions.inputPadding,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: AppDimensions.inputBorderRadius,
          ),
          fillColor: Colors.white12,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: AppDimensions.inputBorderRadius,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: AppDimensions.inputBorderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: AppDimensions.inputBorderRadius,
          ),
        ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        foregroundColor: preferences.themeColors.highlight,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.inputBorderRadius,
        ),
        padding: AppDimensions.inputPadding,
      ),
    ),

    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 0,
      color: Colors.transparent,
      margin: const EdgeInsets.all(0),
    ),
  );
}
