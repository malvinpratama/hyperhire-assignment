import 'package:flutter/material.dart';

class AppLocale {
  AppLocale._();

  static const String path = 'assets/translations';

  static const indonesianID = Locale('id', 'ID');
  static const englishUS = Locale('en', 'US');
  static const koreanKr = Locale('ko', 'KR');

  static const List<Locale> supportedLocaleList = <Locale>[
    indonesianID,
    englishUS,
    koreanKr,
  ];

  static const Locale startLocale = koreanKr;
  static const Locale fallbackLocale = englishUS;

  static String getLocaleShortName(Locale locale) {
    switch (locale) {
      case indonesianID:
        return 'IDN';

      case englishUS:
        return 'EN';
      case koreanKr:
        return 'KOR';
      default:
        return 'KOR';
    }
  }

  static Locale getLocale(String name) {
    switch (name) {
      case 'INDONESIA':
        return indonesianID;
      case 'ENGLISH':
        return englishUS;
      case 'KOREA':
        return koreanKr;
      default:
        return koreanKr;
    }
  }
}
