import 'package:explore_and_go_application/Screens/SignUp/signup_screen.dart';
import 'package:explore_and_go_application/Screens/SignIn/Signin_scree.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to provide the height and width of screen based on the Screen ratio
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: size.height * 0.03),
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                height: size.height * 0.3,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const Text(
                "Explore & Go",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Text(
                "Product Description",
                style: TextStyle(fontSize: 14, color: lightTextColor),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              RoundButton(
                  text: "Sign Up",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  }),
              RoundButton(
                  text: "Sign In",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignInScreen();
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
