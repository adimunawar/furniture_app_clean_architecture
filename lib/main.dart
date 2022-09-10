import 'package:e_furniture/core/bloc/app_level_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/screens/login_screens.dart';
import 'package:e_furniture/features/home/presentation/bloc/cubit/rowmenu_cubit.dart';
import 'package:e_furniture/features/home/presentation/screens/home_screen.dart';
import 'package:e_furniture/screens/onboarding_screen.dart';
import 'package:e_furniture/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import './service_locator.dart' as service_locator;
import 'service_locator.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBoardingScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ], initialLocation: '/splash', debugLogDiagnostics: true);
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RowmenuCubit>(create: (_) => locator<RowmenuCubit>()),
          BlocProvider<AppLevelBloc>(
              create: (context) => locator<AppLevelBloc>()..add(AppStarted())),
          BlocProvider<AuthenticationBloc>(
              create: (context) => locator<AuthenticationBloc>()),
        ],
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          debugShowCheckedModeBanner: false,
          title: 'Furniture',
          builder: EasyLoading.init(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
