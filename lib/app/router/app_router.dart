import 'package:dokan_khata_bd/features/auth/presentation/pages/language_selection_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/login_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,

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
  ],
);