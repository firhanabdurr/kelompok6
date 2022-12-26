import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  static Color bgColor = Color(0xFFE5FCE5);
  static Color mainColor = Color(0xFF43A047);
  static Color accentColor = Color(0xFF1B5E20);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
  ];

static TextStyle mainTitle =
    GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);
static TextStyle mainContent =
    GoogleFonts.nunito(fontSize: 14.0, fontWeight: FontWeight.normal);
static TextStyle dateTitle =
    GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 13.0);
}