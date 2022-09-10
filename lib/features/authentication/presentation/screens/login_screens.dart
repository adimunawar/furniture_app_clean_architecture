import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:e_furniture/features/home/presentation/screens/home_screen.dart';
import 'package:e_furniture/features/authentication/presentation/screens/register_screens.dart';
import 'package:e_furniture/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isShowPassword = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: ((context, state) {
        if (state.status!.isLoading) {
          EasyLoading.show(status: 'loading...');
        } else if (state.status!.isSuccess) {
          EasyLoading.dismiss();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else if (state.status!.isError) {
          EasyLoading.dismiss();
          EasyLoading.showToast("${state.errorHandler!.message}",
              toastPosition: EasyLoadingToastPosition.bottom,
              dismissOnTap: true);
        }
      }), builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width / 2 - 75,
                            color: kGreyColor2,
                          ),
                          Image.asset(
                            'assets/icons/logo.png',
                            width: 63,
                          ),
                          Container(
                            height: 1.5,
                            width: MediaQuery.of(context).size.width / 2 - 75,
                            color: kGreyColor2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text("Hello !",
                          style: primaryTextStyle.copyWith(
                              color: kGreyColor,
                              fontSize: 30,
                              fontWeight: semiBold)),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("WELCOME BACK",
                          style: primaryTextStyle.copyWith(
                              fontSize: 30, fontWeight: medium)),
                    ],
                  ),
                ),

                //textfield
                Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  elevation: 3.0,
                  margin: const EdgeInsets.only(right: 30, top: 25),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 30, top: 35, bottom: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: primaryTextStyle.copyWith(color: kGreyColor2),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextField(
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: kGreyColor2)),
                            ),
                            controller: usernameController,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Password",
                          style: primaryTextStyle.copyWith(color: kGreyColor2),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextField(
                            controller: passwordController,
                            obscureText: isShowPassword ? false : true,
                            decoration: InputDecoration(
                              suffixIcon: !isShowPassword
                                  ? InkWell(
                                      onTap: (() => setState(() {
                                            isShowPassword = !isShowPassword;
                                          })),
                                      child: const Icon(Icons.visibility))
                                  : InkWell(
                                      onTap: () => setState(() {
                                            isShowPassword = !isShowPassword;
                                          }),
                                      child: const Icon(Icons.visibility_off)),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: kGreyColor2)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 35, bottom: 40, right: 20),
                          child: Center(
                              child: InkWell(
                            onTap: (() {}),
                            child: Text(
                              "Forgot Password",
                              style: primaryTextStyle.copyWith(fontSize: 18),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: InkWell(
                            onTap: () {
                              _loginUser(
                                context,
                              );
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  "Log in",
                                  style: primaryTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: semiBold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35, right: 20),
                          child: Center(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: Text(
                              "SIGN UP",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: medium),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _loginUser(
    BuildContext context,
  ) async {
    context.read<AuthenticationBloc>().add(LoginUserWithUsername(
        username: usernameController.text, password: passwordController.text));
  }
}
