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
                  provider.setLocale(localeUz, '');
                  break;
                case localeScriptCyrl:
                  provider.setLocale(localeUz, localeScriptCyrl);
                  break;
                case localeRu:
                  provider.setLocale(localeRu, '');
                  break;
                case localeEn:
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
