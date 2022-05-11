import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:key_board_app/pages/home_page.dart';
import 'themes/theme_of_app.dart';

void main(List<String> args) async {
  // flutter Binding Initialized
  WidgetsFlutterBinding.ensureInitialized();

  // easy localization Initialized
  await EasyLocalization.ensureInitialized();

  runApp(
    // easy localization
    EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),
        ],
        path: 'assets/lang', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: const App()),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeOf.ligth(),
      home: HomePage(),
    );
  }
}
