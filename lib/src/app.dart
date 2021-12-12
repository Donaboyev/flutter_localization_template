import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization_template/src/bloc/locale_provider.dart';
import 'package:localization_template/src/data/app_constants.dart';
import 'package:localization_template/src/data/db/local_source.dart';
import 'package:provider/provider.dart';

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final T = AppLocalizations.of(context);
    final provider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(T?.localizationApp ?? ''),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                child: Text('O\'zbekcha'),
                value: localeUz,
              ),
              const PopupMenuItem<String>(
                child: Text('Ўзбекча'),
                value: localeScriptCyrl,
              ),
              const PopupMenuItem<String>(
                child: Text('Русский'),
                value: localeRu,
              ),
              const PopupMenuItem<String>(
                child: Text('English'),
                value: localeEn,
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case localeUz:
                  LocalSource.instance.setLocaleCode(localeCode: localeUz);
                  LocalSource.instance.setLocaleScriptCode('');
                  provider.setLocale(localeUz, '');
                  break;
                case localeScriptCyrl:
                  LocalSource.instance.setLocaleCode(localeCode: localeUz);
                  LocalSource.instance.setLocaleScriptCode(localeScriptCyrl);
                  provider.setLocale(localeUz, localeScriptCyrl);
                  break;
                case localeRu:
                  LocalSource.instance.setLocaleCode(localeCode: localeRu);
                  LocalSource.instance.setLocaleScriptCode('');
                  provider.setLocale(localeRu, '');
                  break;
                case localeEn:
                  LocalSource.instance.setLocaleCode(localeCode: localeEn);
                  LocalSource.instance.setLocaleScriptCode('');
                  provider.setLocale(localeEn, '');
                  break;
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          T?.centerText ?? '',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
