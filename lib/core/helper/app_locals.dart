import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../network/local/cache/cache_helper.dart';

class AppLocales {
  /// CURRENT LANG
  static int? currentLang;

  static Future<void> init() async {
    /// GET DEVICE LANG CODE
    // String languageCode = Intl.systemLocale.split('_')[0];

    /// SAVE DEFAULT LANG
    await CacheHelper.get('lang') ??
        await CacheHelper.save(
          'lang',
          'en',
          // languageCode == 'ar' || languageCode == 'en' ? languageCode : 'en',
        );

    /// GET LANG
    String lang = await CacheHelper.get('lang');

    /// CURRENT LANG
    if (lang == 'ar') {
      currentLang = 0;
    } else if (lang == 'en') {
      currentLang = 1;
    }
  }

  /// LIST OF SUPPORTED LOCALES
  static const supportedLocales = [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];

  /// LIST OF SUPPORTED LOCALES NAMES
  static const supportedLocalesNames = [
    'العربية',
    'English',
  ];

  /// LIST OF SUPPORTED LOCALES CODES
  static const supportedLocalesCodes = [
    'ar',
    'en',
  ];

  /// CURRENT APP LOCALE
  static Locale currentLocale = supportedLocales[currentLang!];

  /// CHANGE APP LANGUAGE
  static void setDeviceLocale(BuildContext context, int index) {
    if (index < 0 || index >= supportedLocales.length) {
      return;
    }
    EasyLocalization.of(context)!
        .setLocale(supportedLocales[index])
        .then((value) => currentLocale = supportedLocales[index]);
  }
}
