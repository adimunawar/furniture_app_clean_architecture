// /font weignt
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

//colors
const Color kGreyColor = Color(0xFF808080);
const Color kGreyColor2 = Color(0xFFBDBDBD);

TextStyle primaryTextStyle = GoogleFonts.gelasio(fontSize: 14);
TextStyle boldTextStyle = GoogleFonts.gelasio(
  fontSize: 14,
  fontWeight: bold,
);

TextStyle greyTextStyle =
    GoogleFonts.gelasio(fontSize: 14, fontWeight: regular, color: kGreyColor);
