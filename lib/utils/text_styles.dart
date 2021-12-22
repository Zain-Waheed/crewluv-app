import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextStyle {
  static TextStyle montserrat(Color color, double fs, FontWeight fw,) {
    return GoogleFonts.montserrat(
        fontSize: fs,
        color: color,
        fontWeight: fw,
    );
  }


}
