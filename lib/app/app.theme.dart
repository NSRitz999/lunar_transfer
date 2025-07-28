import 'package:flutter/material.dart';
import 'package:ftk_ui/ftk_ui.dart';

class LunarTheme extends FtkTheme {
  LunarTheme()
      : super(
          dark: darkTheme,
          light: lightTheme,
        );

  static List<BoxShadow> get shadows => [
        const BoxShadow(
          offset: Offset(2, 4),
        ),
      ];

  static BorderRadiusGeometry get defaultBorderRadius =>
      BorderRadiusGeometry.circular(32);

  static EdgeInsets get padding => const EdgeInsets.all(32);
}

final FtkThemeData darkTheme = FtkThemeData(
  themeData: ThemeData.dark(),
  ftkPalette: darkPalette,
  ftkTextTheme: FtkTextTheme.fromBrightnessDefault(
    Brightness.dark,
    fontFamily: 'Roboto',
  ),
);

/// Light theme will only be treated as "dark" theme
final FtkThemeData lightTheme = FtkThemeData(
  themeData: ThemeData.dark(),
  ftkPalette: darkPalette,
  ftkTextTheme: FtkTextTheme.fromBrightnessDefault(
    Brightness.light,
    fontFamily: 'Roboto',
  ),
);

class LunarPalette {
  const LunarPalette._();

  static const Color blue = Color(0xFF9FB3DF);
  static const Color lightBlue = Color(0xFF9EC6F3);
  static const Color seaGreen = Color(0xFFBDDDE4);
  static const Color beige = Color(0xFFFFF1D5);
  static const Color darkblue = Color(0xFF35374B);
  static const Color darkWidget = Color.fromARGB(255, 27, 28, 38);
  static const Color darkBlueGreen = Color(0xFF344953);
  static const Color darkSeaGreen = Color(0xFF50727B);
  static const Color green = Color(0xFF78A083);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color red = Colors.redAccent;

  static const Color eggWhite = Color(0xFFF1EBDD);
}

final FtkThemePalette lightPalette = FtkThemePalette(
  primary: LunarPalette.blue,
  secondary: LunarPalette.seaGreen,
  textColor: LunarPalette.black,
  buttonColor: LunarPalette.blue,
  error: LunarPalette.red,
  background: LunarPalette.beige,
);

final FtkThemePalette darkPalette = FtkThemePalette(
  primary: LunarPalette.lightBlue,
  secondary: LunarPalette.green,
  textColor: LunarPalette.white,
  buttonColor: LunarPalette.darkSeaGreen,
  error: LunarPalette.red,
  background: LunarPalette.darkblue,
);
