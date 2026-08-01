import 'package:dokan_khata_bd/core/utils/app_formatter.dart';
import 'package:dokan_khata_bd/shared/widgets/app_button.dart';
import 'package:dokan_khata_bd/shared/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class OtpVerificationPage extends StatefulWidget {
  final String mobileNumber;

  const OtpVerificationPage({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    for (final node in focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  Widget otpBox(int index) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "",
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).requestFocus(focusNodes[index + 1]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 30),

              const AppLogo(width: 160),

              const SizedBox(height: 30),

              const Text(
                "Verify Mobile Number",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "We sent a 6-digit verification code to\n${AppFormatter.maskPhone(widget.mobileNumber)}",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                      (index) => otpBox(index),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "00:30",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              TextButton(
                onPressed: null,
                child: const Text("Resend OTP"),
              ),

              const Spacer(),

              AppButton(
                text: "Verify",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}