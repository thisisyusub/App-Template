/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static final largeTextStyle = GoogleFonts.roboto(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  static final mediumTextStyle =
      GoogleFonts.roboto(fontSize: 18, color: Colors.white);

  static final mediumTextStyleV2 = GoogleFonts.roboto(fontSize: 18);

  static final tinyTextStyle =
      GoogleFonts.roboto(fontSize: 12, color: Colors.white);
}
