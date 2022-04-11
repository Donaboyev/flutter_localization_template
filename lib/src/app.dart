import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/app_constants.dart';
import 'bloc/app_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final T = AppLocalizations.of(context);
    final provider = Provider.of<AppProvider>(context);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              T?.centerText ?? '',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 26),
            Switch(
              value: provider.themeMode == ThemeMode.dark,
              onChanged: (value) {
                debugPrint('switch value: $value');
                provider.setTheme(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ],
        ),
      ),
    );
  }
}
