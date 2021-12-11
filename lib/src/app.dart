import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:localization_template/src/data/app_constants.dart';

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supportedLocales = List<Locale>.from(AppLocalizations.supportedLocales);
    print('=============> app supported locales: $supportedLocales');
    final T = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(T?.localizationApp ?? ''),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => buildLanguageItems(context),
          ),
        ],
      ),
      body: Center(child: Text(T?.centerText ?? '')),
    );
  }

  List<PopupMenuItem<String>> buildLanguageItems(BuildContext context) {
    List<PopupMenuItem<String>> items = [];
    for (String locale in getListOfSupportedLocales(context)) {
      items.add(
        PopupMenuItem<String>(
          child: Text(locale),
          value: hideChooseLangTab,
        ),
      );
    }
    return items;
  }

  List<String> getListOfSupportedLocales(BuildContext context) {
    var supportedLocales = AppLocalizations.supportedLocales;
    print('supported: $supportedLocales');
    List<String> localeNames = [];
    for (Locale locale in supportedLocales) {
      print(
          '=============> getListOfSupportedLocales language code: ${locale.languageCode}');
      if (locale.scriptCode?.isEmpty ?? true) {
        localeNames.add(
          LocaleNames.of(context)!.nameOf(locale.languageCode).toString(),
        );
      } else {
        localeNames.add(
          LocaleNames.of(context)!
              .nameOf('${locale.languageCode}_${locale.scriptCode}')
              .toString(),
        );
      }
    }
    print('=============> getListOfSupportedLocales: $localeNames');
    return localeNames;
  }
}
