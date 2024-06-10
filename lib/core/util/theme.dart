import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color primaryColor = Color(0xFF6200EE);
const Color primaryVariantColor = Color(0xFF3700B3);
const Color secondaryColor = Color(0xFF03DAC6);
const Color secondaryVariantColor = Color(0xFF018786);
const Color backgroundColor = Color(0xFFFFFFFF);
const Color surfaceColor = Color(0xFFFFFFFF);
const Color errorColor = Color(0xFFB00020);
const Color onPrimaryColor = Color(0xFFFFFFFF);
const Color onSecondaryColor = Color(0xFF000000);
const Color onBackgroundColor = Color(0xFF000000);
const Color onSurfaceColor = Color(0xFF000000);
const Color onErrorColor = Color(0xFF000000);
const Color dividerColor = Color(0xFFFF7F41);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 24.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 12.0;
const double kSpaceL = 16.0;

const double kRadiusM = 16.0;
const double kRadiusS = 8.0;

const double buttonDefaultHeight = 50.0;
const double fontSizeDefault = 16.0;

// Spacing
const double kIconS = 24.0;
const double kIconM = 36.0;
const double kIconL = 48.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

const familyFont = 'PolySans';

// Text Styling

TextStyle headline2 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 60,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle headline3 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 48,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle headline4 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 34,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle headline5 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 24,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle headline6 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 20,
    letterSpacing: 0.15,
    color: onBackgroundColor,
    fontWeight: FontWeight.w700,
  ),
);
TextStyle body1 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 16,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle body2 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 14,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle button = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 14,
    color: onPrimaryColor,
    fontWeight: FontWeight.w700,
  ),
);
TextStyle caption = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 12,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle subTitle1 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 16,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle subTitle2 = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 14,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);
TextStyle overline = GoogleFonts.raleway(
  textStyle: const TextStyle(
    fontSize: 14,
    color: onBackgroundColor,
    fontWeight: FontWeight.normal,
  ),
);

InputDecoration kTextFieldDecoration = InputDecoration(
  hintText: 'Milk, water, bread, oil, tomatto...',
  fillColor: onPrimaryColor,
  hintStyle: body2,
  filled: true,
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  suffixIcon: const Icon(
    Icons.search,
    color: primaryColor,
  ),
  suffixIconColor: primaryColor,
  border: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kRadiusM)),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 0),
    borderRadius: BorderRadius.all(Radius.circular(kRadiusM)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 0),
    borderRadius: BorderRadius.all(Radius.circular(kRadiusM)),
  ),
);

// Light Theme
ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    primaryColorDark: primaryColor,
    secondaryHeaderColor: secondaryColor,
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
    textTheme: const TextTheme(),
    inputDecorationTheme: const InputDecorationTheme(),
    appBarTheme: const AppBarTheme(
        color: primaryColor,
        actionsIconTheme: IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor));

// Dark Theme.
ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
);
