import 'package:flutter/material.dart';

class DokanKhataApp extends StatelessWidget {
  const DokanKhataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dokan Khata BD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Dokan Khata BD',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}