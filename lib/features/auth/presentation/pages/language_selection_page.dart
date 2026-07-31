import 'package:dokan_khata_bd/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              child: const Text("বাংলা"),
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {},
              child: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}