import 'package:dokan_khata_bd/app/router/app_routes.dart';
import 'package:dokan_khata_bd/features/auth/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
  ],
);