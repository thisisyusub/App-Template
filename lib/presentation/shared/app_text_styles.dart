import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final largeTextStyle = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final mediumTextStyle = GoogleFonts.roboto(
    fontSize: 18,
    color: Colors.white,
  );

  static final tinyTextStyle = GoogleFonts.roboto(
    fontSize: 12,
    color: Colors.white,
  );
}
