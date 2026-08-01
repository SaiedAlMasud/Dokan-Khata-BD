import 'package:dokan_khata_bd/app/router/app_routes.dart';
import 'package:dokan_khata_bd/features/auth/presentation/widgets/pin_indicator.dart';
import 'package:dokan_khata_bd/features/auth/presentation/widgets/pin_keypad.dart';
import 'package:flutter/material.dart';
import 'package:dokan_khata_bd/core/services/local_storage_service.dart';
import 'package:go_router/go_router.dart';

class ConfirmPinPage extends StatefulWidget {
  final String pin;

  const ConfirmPinPage({
    super.key,
    required this.pin,
  });

  @override
  State<ConfirmPinPage> createState() => _ConfirmPinPageState();
}

class _ConfirmPinPageState extends State<ConfirmPinPage> {
  String _confirmPin = "";

  void _onNumberPressed(String number) {
    if (_confirmPin.length >= 4) return;

    setState(() {
      _confirmPin += number;
    });

    if (_confirmPin.length == 4) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;

        _verifyPin();
      });
    }
  }

  void _onBackspace() {
    if (_confirmPin.isEmpty) return;

    setState(() {
      _confirmPin =
          _confirmPin.substring(0, _confirmPin.length - 1);
    });
  }

  Future<void> _verifyPin() async {
    if (_confirmPin == widget.pin) {
      await _savePin();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PIN doesn't match"),
        ),
      );

      setState(() {
        _confirmPin = "";
      });
    }
  }

  Future<void> _savePin() async {
    await LocalStorageService.savePin(widget.pin);

    await LocalStorageService.setShopSetupCompleted(true);

    if (!mounted) return;

    context.go(AppRoutes.shopSetup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm PIN"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const Text(
                "Confirm your PIN",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Re-enter your 4-digit PIN.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              PinIndicator(
                currentLength: _confirmPin.length,
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