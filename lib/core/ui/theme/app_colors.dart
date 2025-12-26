import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';


/// Centralized color constants for both light & dark themes.
/// Uses `Map<ThemeType, Color>` to access colors for specific themes
class AppColors {
  // ---------------------------
  // BACKGROUND COLORS
  // ---------------------------
  static const Map<ThemeType, Color> primaryBackground = {
    ThemeType.light: Color(0xFFF6F5FA),
    ThemeType.dark: Color(0xFF070C13),
  };
  static const Map<ThemeType, Color> secondaryBackground = {
    ThemeType.light: Color(0xFFE8E8F0),
    ThemeType.dark: Color(0xFF111319),
  };


  // ---------------------------
  // TEXT COLORS
  // ---------------------------
  static const Map<ThemeType, Color> text = {
    ThemeType.light: Colors.black,
    ThemeType.dark: Colors.white,
  };
  static const Map<ThemeType, Color> textSecondary = {
    ThemeType.light: Color(0x99000000),
    ThemeType.dark: Color(0x99FFFFFF),
  };
  static const Map<ThemeType, Color> textTernary = {
    ThemeType.light: Color(0x66000000),
    ThemeType.dark: Color(0x66FFFFFF),
  };


  // ---------------------------
  // ICON COLORS
  // ---------------------------
  static const Map<ThemeType, Color> icon = {
    ThemeType.light: Colors.black,
    ThemeType.dark: Colors.white,
  };
  static const Map<ThemeType, Color> iconSecondary = {
    ThemeType.light: Color(0x99000000),
    ThemeType.dark: Color(0x99FFFFFF),
  };
  static const Map<ThemeType, Color> iconTernary = {
    ThemeType.light: Color(0x66000000),
    ThemeType.dark: Color(0x66FFFFFF),
  };


  // ---------------------------
  // CONTAINER COLORS
  // ---------------------------
  static const Map<ThemeType, Color> primaryContainer = {
    ThemeType.light: Color(0xFFF3F4F9),
    ThemeType.dark: Color(0xFF161A25),
  };
  static const Map<ThemeType, Color> secondaryContainer = {
    ThemeType.light: Color(0xFFE9E9E9),
    ThemeType.dark: Color(0xFF1A2130),
  };


  // ---------------------------
  // SURFACE COLORS
  // ---------------------------
  static const Map<ThemeType, Color> surfaceContainerSecondary = {
    ThemeType.light: Color(0x14000000),
    ThemeType.dark: Color(0x14FFFFFF),
  };
  static const Map<ThemeType, Color> surfaceContainerTernary = {
    ThemeType.light: Color(0x0A000000),
    ThemeType.dark: Color(0x0AFFFFFF),
  };
  static const Map<ThemeType, Color> surfaceBorder = {
    ThemeType.light: Colors.white10,
    ThemeType.dark: Colors.white10,
  };

  // ---------------------------
  // MISC COLORS
  // ---------------------------
  static const Map<ThemeType, Color> divider = {
    ThemeType.light: Color(0x10000000),
    ThemeType.dark: Color(0xFF1C232A),
  };
  static const Map<ThemeType, Color> shadow = {
    ThemeType.light: Color(0x42000000),
    ThemeType.dark: Color(0x42000000),
  };
  static const lightGreen = Color(0xFF5CB75F);
  static const lightRed = Color(0xFFEB5A5A);
}