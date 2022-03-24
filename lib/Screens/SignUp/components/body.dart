import 'package:explore_and_go_application/Screens/SignIn/Signin_scree.dart';
import 'package:explore_and_go_application/components/SignWithButton.dart';
import 'package:explore_and_go_application/components/or_divider.dart';
import 'package:explore_and_go_application/components/password_inputField.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/components/round_text_inputField.dart';
import 'background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to provide the height and width of screen based on the Screen ratio
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(bottom: size.height * 0.03),
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const TextFieldConatiner(
                icon: Icons.person,
                text: "Enter Full name",
              ),
              const TextFieldConatiner(icon: Icons.email, text: "Enter email"),
              const PassowrdTextField(
                text: "Your password",
              ),
              RoundButton(
                text: "Sign Up",
                press: () {},
                width: 0.6,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const OrDivider(),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: 44,
                child: CustomRaisedButton(
                    color: Colors.yellow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("images/google-logo.png"),
                        const Text("Sign up with Google",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 15.0)),
                        Opacity(
                          opacity: 0.0,
                          child: Image.asset("images/google-logo.png"),
                        ),
                      ],
                    ),
                    onPressed: () {}),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignInScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
