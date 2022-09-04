import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:e_furniture/features/authentication/presentation/screens/home_screen.dart';
import 'package:e_furniture/features/authentication/presentation/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    Text("WELCOME",
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
                  padding: const EdgeInsets.only(left: 30, top: 35, bottom: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: primaryTextStyle.copyWith(color: kGreyColor2),
                      ),
                      SizedBox(
                        height: 30,
                        child: TextField(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: kGreyColor2)),
                          ),
                          controller: nameController,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Email",
                        style: primaryTextStyle.copyWith(color: kGreyColor2),
                      ),
                      SizedBox(
                        height: 30,
                        child: TextField(
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: kGreyColor2)),
                          ),
                          controller: emailController,
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
                                borderSide:
                                    BorderSide(width: 1.0, color: kGreyColor2)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Confirm Password",
                        style: primaryTextStyle.copyWith(color: kGreyColor2),
                      ),
                      SizedBox(
                        height: 30,
                        child: TextField(
                          controller: confirmController,
                          obscureText: isShowConfirmPassword ? false : true,
                          decoration: InputDecoration(
                            suffixIcon: !isShowPassword
                                ? InkWell(
                                    onTap: (() => setState(() {
                                          isShowConfirmPassword =
                                              !isShowConfirmPassword;
                                        })),
                                    child: const Icon(Icons.visibility))
                                : InkWell(
                                    onTap: () => setState(() {
                                          isShowConfirmPassword =
                                              !isShowConfirmPassword;
                                        }),
                                    child: const Icon(Icons.visibility_off)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: kGreyColor2)),
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
                            _registerUser(context);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "SIGN UP",
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
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Alredy have account? ",
                                style: primaryTextStyle,
                              ),
                              Text(
                                "SIGN IN",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              ),
                            ],
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
      ),
    );
  }

  void _registerUser(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(RegisterUserWithEmail(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text));
    AuthenticationState state = context.read<AuthenticationBloc>().state;

    // if (state is AuthenticatedUser) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    // } else if (state is AuthenticationFailure) {
    //   print(state.errorHandler!.message);
    // }
  }
}
