import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static double defaultPadding = 16.0;
  static double defaultBorderRadius = 6.0;
  static double defaultElevation = 8.0;

  static Color primaryColor = const Color(0xFFffebac);
  static Color primaryColorWithOpacity =
      const Color(0xFFFFDB15).withOpacity(.8);
  static Color secondaryColor = const Color(0xFF1D1D1D);
  static Color secondaryColorWithOpacity =
      const Color(0xFF020301).withOpacity(.8);
  static Color textColor = const Color(0xFF020301);

  static TextStyle titleTextStyle = GoogleFonts.roboto(
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle normalTextStyle = GoogleFonts.roboto(
    color: textColor,
    fontSize: 14,
  );

  static TextStyle drawerTextStyle = GoogleFonts.roboto(
    color: textColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    primary: secondaryColor,
    onSurface: secondaryColorWithOpacity,
    elevation: defaultElevation,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
    ),
    textStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
  );

  static InputDecoration inputStyle({String? hintText, Widget? suffixIcon}) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      );
}
