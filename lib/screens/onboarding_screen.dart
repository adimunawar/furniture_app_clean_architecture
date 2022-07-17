import 'package:e_furniture/core/ui_helper/theme.dart';
import 'package:e_furniture/features/authentication/presentation/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/onboarding.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MAKE YOUR",
                  style: primaryTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 24),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "HOME BEAUTIFUL",
                  style: boldTextStyle.copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "The best simple place where you discover most wonderful furnitures and make your home beautiful",
                    style: greyTextStyle.copyWith(fontSize: 18, height: 1.8),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black, minimumSize: Size(159, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Get Started",
                        style: primaryTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
