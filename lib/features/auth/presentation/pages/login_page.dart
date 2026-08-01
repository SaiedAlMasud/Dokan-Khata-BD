import 'package:dokan_khata_bd/shared/widgets/app_button.dart';
import 'package:dokan_khata_bd/shared/widgets/app_logo.dart';
import 'package:dokan_khata_bd/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:dokan_khata_bd/core/utils/validators.dart';
import 'package:go_router/go_router.dart';
import 'package:dokan_khata_bd/app/router/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              const SizedBox(height: 40),

              const AppLogo(width: 170),

              const SizedBox(height: 40),

              const Text(
                "Welcome to Dokan Khata BD",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              const Text(
                "Manage your grocery shop easily",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              AppTextField(
                controller: _mobileController,
                labelText: "Mobile Number",
                hintText: "01XXXXXXXXX",
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_android,
                validator: Validators.validateBangladeshPhone,
              ),

              const SizedBox(height: 25),

              AppButton(
                text: "Continue",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.go(
                      '${AppRoutes.otp}/${_mobileController.text.trim()}',
                    );
                  }
                },
              ),

              const SizedBox(height: 20),

              const Text(
                "Your account will be created automatically if it doesn't exist.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}