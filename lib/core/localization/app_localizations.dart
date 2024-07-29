import 'package:beam_challange_ps/core/localization/assets/en.dart';
import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  static final AppLocalizations _instance = AppLocalizations._internal();

  factory AppLocalizations() {
    return _instance;
  }

  AppLocalizations._internal();

  Map<AppStringKeys, String>? _localizedStrings;

  Future<void> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        _localizedStrings = i18nEn;
        break;
      default:
        _localizedStrings = i18nEn;
    }
  }

  String t(AppStringKeys? stringKey) {
    return _localizedStrings?[stringKey] ?? stringKey?.key ?? "";
  }

  AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}
