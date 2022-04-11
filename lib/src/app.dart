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
        title: Text(
          T?.localizationApp ?? '',
          style: Theme.of(context).textTheme.headline4,
        ),
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
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: provider.themeMode,
                  onChanged: (ThemeMode? value) {
                    debugPrint('==> dark theme button $value');
                    provider.setTheme(value ?? ThemeMode.dark);
                  },
                ),
                const Text('Dark theme'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: provider.themeMode,
                  onChanged: (ThemeMode? value) {
                    debugPrint('==> light theme button $value');
                    provider.setTheme(value ?? ThemeMode.light);
                  },
                ),
                const Text('Light theme'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: provider.themeMode,
                  onChanged: (ThemeMode? value) {
                    debugPrint('==> light theme button $value');
                    provider.setTheme(value ?? ThemeMode.system);
                  },
                ),
                const Text('System theme'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
