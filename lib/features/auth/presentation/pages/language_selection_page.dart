import 'package:dokan_khata_bd/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:dokan_khata_bd/app/providers/locale_provider.dart';
import 'package:dokan_khata_bd/app/router/app_routes.dart';

class LanguageSelectionPage extends ConsumerWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const AppLogo(),
            const SizedBox(height: 30),

            const Text(
              'Select your preferred language',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () async {
                await ref.read(localeProvider.notifier).changeLocale('bn');

                if (context.mounted) {
                  context.go(AppRoutes.login);
                }
              },
              child: const Text("বাংলা"),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () async {
                await ref.read(localeProvider.notifier).changeLocale('en');

                if (context.mounted) {
                  context.go(AppRoutes.login);
                }
              },
              child: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}