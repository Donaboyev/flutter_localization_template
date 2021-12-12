import 'package:flutter/material.dart';
import 'package:localization_template/src/data/db/local_source.dart';

class LocaleProvider extends ChangeNotifier {
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

  void clearLocale() {
    LocalSource.instance.clear();
    notifyListeners();
  }
}
