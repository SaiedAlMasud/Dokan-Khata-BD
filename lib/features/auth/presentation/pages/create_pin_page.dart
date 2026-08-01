import 'package:dokan_khata_bd/features/auth/presentation/widgets/pin_indicator.dart';
import 'package:dokan_khata_bd/features/auth/presentation/widgets/pin_keypad.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dokan_khata_bd/app/router/app_routes.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  String _pin = "";

  void _onNumberPressed(String number) {
    if (_pin.length >= 4) return;

    setState(() {
      _pin += number;
    });

    if (_pin.length == 4) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;

        context.push(
          AppRoutes.confirmPin,
          extra: _pin,
        );
      });
    }
  }

  void _onBackspace() {
    if (_pin.isEmpty) return;

    setState(() {
      _pin = _pin.substring(0, _pin.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create PIN"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Text(
                "Create a 4-digit PIN",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "This PIN will be used to unlock your shop.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              PinIndicator(
                currentLength: _pin.length,
              ),

              const Spacer(),

              PinKeypad(
                onNumberPressed: _onNumberPressed,
                onBackspace: _onBackspace,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}