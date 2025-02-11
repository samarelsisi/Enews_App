import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news/providers/app_theme_provider.dart';
import 'package:news/style/apptheme.dart';
import 'package:news/ui/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  await EasyLocalization.ensureInitialized(); // Initialize EasyLocalization

  runApp(
    EasyLocalization(
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ], // Define supported locales
      path: 'assets/translations', // Path to your translation files
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      locale: context.locale, // Set the app locale from EasyLocalization
      localizationsDelegates: context.localizationDelegates, // Localization delegates
      supportedLocales: context.supportedLocales, // Supported locales
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}