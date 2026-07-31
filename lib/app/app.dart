import 'package:flutter/material.dart';

import 'router/app_router.dart';
import 'theme/app_theme.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dokan_khata_bd/l10n/app_localizations.dart';

class DokanKhataApp extends StatelessWidget {
  const DokanKhataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dokan Khata BD',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}