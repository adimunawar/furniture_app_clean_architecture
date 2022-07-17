import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: ((context, state) {
          if (state is AuthenticatedUser) {}
        }),
        builder: (context, state) {
          // if (state is AuthenticationInitial) {
          //   return Center(
          //     child: Text("initial"),
          //   );
          // }
          if (state is AuthenticatedUser) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
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
                            style:
                                primaryTextStyle.copyWith(color: kGreyColor2),
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
                            style:
                                primaryTextStyle.copyWith(color: kGreyColor2),
                          ),
                          SizedBox(
                            height: 30,
                            child: TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.0, color: kGreyColor2)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 35, bottom: 40, right: 20),
                            child: Center(
                                child: Text(
                              "Forgot Password",
                              style: primaryTextStyle.copyWith(fontSize: 18),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 35, right: 20),
                            child: Center(
                                child: Text(
                              "SIGN UP",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 18, fontWeight: medium),
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
        },
      ),
    );
  }

  void _loginUser(BuildContext context) {
    //dispatching the event
    BlocProvider.of<AuthenticationBloc>(context).add(LoginUserWithUsername(
        username: usernameController.text, password: passwordController.text));
  }
}
