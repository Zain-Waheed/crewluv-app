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
  static TextStyle mullerText(Color color, double fs, FontWeight fw,) {
    return TextStyle(
      fontSize: fs,
      color: color,
      fontFamily: 'muller',
      fontWeight: fw,
    );
  }
  static TextStyle montserratUnderlined(Color color, double fs, FontWeight fw,) {
    return GoogleFonts.montserrat(
      fontSize: fs,
      color: color,
      fontWeight: fw,
      decoration: TextDecoration.underline,
    );
  }
  static TextStyle poppins(Color color, double fs, FontWeight fw,) {
    return GoogleFonts.poppins(
      fontSize: fs,
      color: color,
      fontWeight: fw,
    );
  }

  static TextStyle SFProTextRegular(double fs , Color color) {
    return TextStyle(
      fontSize: fs,
      fontFamily: 'SFProTextRegular',
      color: color,
    );
  }

}
