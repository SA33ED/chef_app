import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyles {
  TextStyle latoStyle36 = GoogleFonts.lato(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: const Color(0xff1E1E1E),
  );
  TextStyle latoStyle24 = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: const Color(0xff1E1E1E),
  );
  TextStyle poppinsStyle24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: const Color(0xffFFFFFF),
  );
  TextStyle poppinsStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xffFFFFFF),
  );
}
