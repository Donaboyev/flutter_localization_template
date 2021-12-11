import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization_template/src/app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_template/src/data/app_options.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelBinding(
      initialModel: AppOptions(
        locale: null,
        platform: defaultTargetPlatform,
      ),
      child: Builder(
        builder: (context){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
              LocaleNamesLocalizationsDelegate()
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: AppOptions.of(context)?.locale,
            home: const LocalizationApp(),
          );
        },
      ),
    );
  }
}
