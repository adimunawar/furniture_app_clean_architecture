import 'package:e_furniture/modules.dart';
import './service_locator.dart' as service_locator;
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
