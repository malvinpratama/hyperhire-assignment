import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/src/utils/utils.dart';

class TextStyleAsset {
  static TextStyle get kBody => GoogleFonts.notoSansKr(
        fontWeight: FontWeight.lerp(FontWeight.w300, FontWeight.w400, 0.5),
        fontSize: 14.sp,
        letterSpacing: -0.05,
        color: ColorAssets.kGraniteGray,
      );
  static TextStyle get kComments => GoogleFonts.notoSansKr(
        fontSize: 12.sp,
        letterSpacing: -0.05,
      );
  static TextStyle get kH1 => GoogleFonts.notoSansKr(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get kH2 => GoogleFonts.notoSansKr(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.05,
      );
  static TextStyle get kH3 => GoogleFonts.notoSansKr(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.05,
      );
  static TextStyle get kH4Bold => GoogleFonts.notoSansKr(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.05,
      );
  static TextStyle get kH4 => GoogleFonts.notoSansKr(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.05,
      );
}
