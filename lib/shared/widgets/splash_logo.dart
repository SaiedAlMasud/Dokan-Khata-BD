import 'package:dokan_khata_bd/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splashLogo,
      width: 220,
      fit: BoxFit.contain,
    );
  }
}