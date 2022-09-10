import 'package:e_furniture/modules.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLevelBloc, AppLevelState>(
      listener: (context, state) {
        if (state is AppFirstTime) {
          context.goNamed('onboarding');
        }
        if (state is AppLevelUnauthenticated) {
          context.goNamed('login');
        }
        if (state is AppLevelAuthenticated) {
          context.goNamed('home');
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
