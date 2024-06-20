import 'package:flutter/material.dart';

/// Defines the color palette for the App UI Kit.
abstract class AppColors {
  static const Color primaryMain = Color(0xFF4c45bf);
  static const MaterialColor secondary = MaterialColor(
    0xFF6e60cf,
    <int, Color>{
      300: Color(0xFF7578DB),
    },
  );

  static const MaterialColor secondaryDark = MaterialColor(
    0xFF133C55,
    <int, Color>{
      50: Color(0xFFF6F8FD),
      100: Color(0xFFB3D0E0),
      200: Color(0xFF80B5CE),
      300: Color(0xFF4D9ABD),
      400: Color(0xFF2680AD),
      500: Color(0xFF133C55),
      600: Color(0xFF0F354C),
      700: Color(0xFF0A2C41),
      800: Color(0xFF062336),
      900: Color(0xFF00171A),
    },
  );

  // GRAY
  static const Color gray100 = Color(0xFF748A9D);
  static const Color gray80 = Color(0xFF9FB2C2);
  static const Color gray50 = Color(0xFFD3DDE6);
  static const Color grayBorderSearch = Color(0xFFE5E5E5);

  /// primary
  static const Color primary = Color(0xFFF29727);

  /// Primary Light
  static const Color primaryLight = Color(0xFFFFEDED);

  /// Primary Dart
  static const Color primaryDart = Color(0xFFD74444);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Black
  static const Color black = Color(0xFF2D2D2B);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// The grey primary color and swatch.
  static const Color grey1 = Color(0XFFF0F1F2);
  static const Color grey2 = Color(0XFFE7E7EF);
  static const Color grey3 = Color(0XFFB9C1E1);
  static const Color grey4 = Color(0XFF9197AE);
  static const Color grey5 = Color(0XFF5A5A5A);
  static const Color grey6 = Color(0x33939AAA);

  static const Color background = Color(0XFF1C1F26);

  /// Error
  static const Color error = Color(0xFF93001A);

  /// Warning
  static const Color warning = Color(0xFFE1980A);

  /// Éxito
  static const Color exito = Color(0xFF08DAC1);

  /// Backgraound
  static const Color backgroundOfert = Color(0xFFFEFEEC);
  static const Color backgroundOfert2 = Color(0xFFECF3FE);
  static const Color backgroundOfert3 = Color(0xFFECFEEF);

  /// Text
  static const Color redText = Color(0xFFDA221C);
  static const Color greenText = Color(0xFF009F03);
  static const Color blackText = Color(0xFF000000);
  static const Color blackText2 = Color(0xFF333333);
  static const Color blackText3 = Color(0xFF707790);
  static const Color ofertText = Color(0xFF3F3F40);
  static const Color greyText = Color(0xFFBBBEC3);

  /// Border
  static const Color borderColor = Color(0xFFD6D6D6);

  ///
  static const Color orange = Color(0xFFFF5100);

  static const Color purpleBackgroundSa = Color(0xFF992f8b);
  static const Color greenBackgroundFk = Color(0xFF92c020);
  static const Color orangeSa = Color(0xFFf59a01);
  static const Color blueSkip = Color(0xFF0094FF);
  static const Color blueFacebook = Color(0xFF3b5998);
  static const Color blueGoogle = Color(0xFF4285F4);
  static const Color blueSoldOut = Color(0xFF4368F9);
  static const Color lyricsBlack = Color(0xFF666666);
  static const Color gray = Color(0xFFCBD5E1);
  static const Color grayCircle = Color(0xFFC3B2AA);
  static const Color pinkSelector = Color(0xFFFF0961);
  static const Color noSelector = Color(0xFFC3B2AA);
  static const Color orangeSelector = Color(0xFFFB8F2B);
  static const Color containerSelector = Color(0xFFE5E5E5);
  static const Color grayMarca = Color(0xFF999999);
  static const Color grayTextSecondary = Color(0xFF9E9E9E);
  static const Color grayTextPrymary = Color(0xFF191919);
  static const Color greenBorder = Color(0xFF86C556);
  static const Color redClose = Color(0xFFCC2440);

  static const Color isSelected = Color(0xFF00C46D);
  static const Color qrContainer = Color(0xFFEEF1FF);
  static const Color redDelete = Color(0xFFFF3C3C);
  static const Color backgroundModal = Color(0xFFB45A07);
  static const Color border = Color(0xFFCCCCCC);
}
