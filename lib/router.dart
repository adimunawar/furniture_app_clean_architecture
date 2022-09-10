import 'package:e_furniture/modules.dart';
import 'package:e_furniture/screens/main_screen.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/splash',
    name: 'splash',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (BuildContext context, GoRouterState state) {
      return const OnBoardingScreen();
    },
  ),
  GoRoute(
      path: '/',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          path: 'register',
          name: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterScreen();
          },
        )
      ]),
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (BuildContext context, GoRouterState state) {
      return const MainScreen();
    },
  ),
], initialLocation: '/splash', debugLogDiagnostics: true);
