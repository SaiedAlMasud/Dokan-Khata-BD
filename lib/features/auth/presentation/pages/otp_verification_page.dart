import 'package:dokan_khata_bd/core/utils/app_formatter.dart';
import 'package:dokan_khata_bd/shared/widgets/app_button.dart';
import 'package:dokan_khata_bd/shared/widgets/app_logo.dart';
import 'package:dokan_khata_bd/shared/widgets/otp_input_field.dart';
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
  String _enteredOtp = "";
  bool _canVerify = false;

  void _verifyOtp() {
    if (_enteredOtp == "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("OTP Verified"),
        ),
      );

      // TODO:
      // Navigate to Create PIN screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP"),
        ),
      );
    }
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

              OtpInputField(
                onChanged: (otp) {
                  setState(() {
                    _enteredOtp = otp;
                    _canVerify = otp.length == 6;
                  });
                },
                onCompleted: (otp) {},
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
                onPressed: _canVerify ? _verifyOtp : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}