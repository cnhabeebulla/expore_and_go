import 'package:explore_and_go_application/Screens/SignUp/components/background.dart';
import 'package:explore_and_go_application/Screens/SignUp/signup_screen.dart';
import 'package:explore_and_go_application/Screens/forgot_password/forgot_passsowrd.dart';
import 'package:explore_and_go_application/components/custom_button.dart';
import 'package:explore_and_go_application/components/or_divider.dart';
import 'package:explore_and_go_application/components/password_input_field.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/components/round_text_input_field.dart';
import 'package:explore_and_go_application/functions/validation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();

  Future SignInMe() async {
    if (formKey.currentState!.validate()) {
      print("loading auth");
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text.trim(), password: _pass.text)
          .then((value) => print(value.user));
      print('login sucess');
      print(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print("errorrrrr");
      }
    }
  }

  Body({Key? key}) : super(key: key);

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
                "Sign In",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const TextFieldConatiner(
                      icon: Icons.email,
                      text: "Enter email",
                      valFunc: emailValidator,
                    ),
                    PassowrdTextField(
                      text: "Your password",
                      valFunc: passwordValidator,
                      controllerName: _pass,
                    ),
                    RoundButton(
                      text: "Sign In",
                      press: () {
                        SignInMe();
                      },
                      width: 0.6,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPassword();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot password ?",
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
                        const Text("Sign In with Google",
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
                  const Text("Create an account - "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
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
