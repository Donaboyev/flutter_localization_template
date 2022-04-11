import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'src/app.dart';
import 'src/bloc/app_provider.dart';
import 'src/data/db/local_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSource.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      builder: (context, child) {
        final provider = Provider.of<AppProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: provider.themeMode,
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.black,
          ),
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            LocaleNamesLocalizationsDelegate()
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: provider.locale,
          home: const LocalizationApp(),
        );
      },
    );
  }
}
