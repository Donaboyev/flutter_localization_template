import 'package:flutter/material.dart';
import 'package:localization_template/src/data/app_constants.dart';

import '../data/db/local_source.dart';

class AppProvider extends ChangeNotifier {
  Locale? get locale {
    final String _script = LocalSource.instance.getScriptCode();
    final String _code = LocalSource.instance.getLocaleCode();
    if (_script.isEmpty) {
      return Locale.fromSubtags(languageCode: _code);
    } else {
      return Locale.fromSubtags(languageCode: _code, scriptCode: _script);
    }
  }

  void setLocale(String languageCode, String? scriptCode) {
    LocalSource.instance.setLocaleCode(localeCode: languageCode);
    LocalSource.instance.setLocaleScriptCode(scriptCode ?? '');
    notifyListeners();
  }

  ThemeMode get themeMode {
    final String _theme = LocalSource.instance.getTheme();
    switch (_theme) {
      case themeDark:
        return ThemeMode.dark;
      case themeLight:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void setTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        LocalSource.instance.setTheme(themeDark);
        break;
      case ThemeMode.light:
        LocalSource.instance.setTheme(themeLight);
        break;
      default:
        LocalSource.instance.setTheme(themeSystem);
        break;
    }
    notifyListeners();
  }

  void clearLocale() {
    LocalSource.instance.clear();
    notifyListeners();
  }
}
