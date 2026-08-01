import 'dart:async';

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
  State<OtpVerificationPage> createState() =>
      _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _otpController = OtpInputFieldController();

  String _enteredOtp = "";
  bool _canVerify = false;
  bool _isVerifying = false;

  int _secondsRemaining = 30;
  bool _canResend = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _secondsRemaining = 30;
      _canResend = false;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (_secondsRemaining == 0) {
          timer.cancel();

          setState(() {
            _canResend = true;
          });

          return;
        }

        setState(() {
          _secondsRemaining--;
        });
      },
    );
  }

  Future<void> _verifyOtp() async {
    setState(() {
      _isVerifying = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isVerifying = false;
    });

    if (_enteredOtp == "123456") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("OTP Verified"),
        ),
      );

      // TODO:
      // context.go(AppRoutes.createPin);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP"),
        ),
      );
    }
  }

  void _resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("OTP Resent"),
      ),
    );

    _otpController.clear();
    _otpController.requestFocus();

    setState(() {
      _enteredOtp = "";
      _canVerify = false;
    });

    _startTimer();
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
                controller: _otpController,
                onChanged: (otp) {
                  setState(() {
                    _enteredOtp = otp;
                    _canVerify = otp.length == 6;
                  });
                },
                onCompleted: (_) {},
              ),

              const SizedBox(height: 35),

              Text(
                "00:${_secondsRemaining.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: _canResend ? _resendOtp : null,
                child: const Text("Resend OTP"),
              ),

              const Spacer(),

              AppButton(
                text: "Verify",
                isLoading: _isVerifying,
                onPressed: _canVerify ? _verifyOtp : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}