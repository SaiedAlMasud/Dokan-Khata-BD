import 'package:dokan_khata_bd/features/auth/presentation/pages/confirm_pin_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/create_pin_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/language_selection_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/login_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/splash_page.dart';
import 'package:dokan_khata_bd/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:dokan_khata_bd/features/shop/presentation/pages/shop_setup_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.dashboard,

  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.languageSelection,
      builder: (context, state) => const LanguageSelectionPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '${AppRoutes.otp}/:mobile',
      builder: (context, state) {
        final mobile = state.pathParameters['mobile']!;

        return OtpVerificationPage(
          mobileNumber: mobile,
        );
      },
    ),

    GoRoute(
      path: AppRoutes.createPin,
      builder: (context, state) => const CreatePinPage(),
    ),

    GoRoute(
      path: AppRoutes.confirmPin,
      builder: (context, state) {
        final pin = state.extra as String;

        return ConfirmPinPage(
          pin: pin,
        );
      },
    ),

    GoRoute(
      path: AppRoutes.shopSetup,
      builder: (context, state) => const ShopSetupPage(),
    ),

    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);