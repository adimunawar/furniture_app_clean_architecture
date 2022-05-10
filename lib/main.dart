import 'package:e_furniture/core/bloc/app_level_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';

import 'package:e_furniture/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './service_locator.dart' as service_locator;
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppLevelBloc>(
              create: (context) => locator<AppLevelBloc>()..add(AppStarted())),
          BlocProvider<AuthenticationBloc>(
              create: (context) => locator<AuthenticationBloc>()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ));
  }
}
