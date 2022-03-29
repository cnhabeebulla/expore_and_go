import 'package:explore_and_go_application/Screens/SignIn/signin_screen.dart';
import 'package:explore_and_go_application/components/custom_button.dart';
import 'package:explore_and_go_application/components/or_divider.dart';
import 'package:explore_and_go_application/components/password_input_field.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/components/round_text_input_field.dart';
import 'package:explore_and_go_application/functions/helper_function.dart';
import 'package:explore_and_go_application/functions/validation.dart';
import 'package:explore_and_go_application/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();

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
          child: Form(
            key: formKey,
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
                TextFieldConatiner(
                  icon: Icons.person,
                  text: "Enter Full name",
                  valFunc: usernameValidator,
                  controller: _username,
                  fieldType: TextInputType.name,
                ),
                TextFieldConatiner(
                  icon: Icons.email,
                  text: "Enter email",
                  valFunc: emailValidator,
                  controller: _email,
                  fieldType: TextInputType.emailAddress,
                ),
                PassowrdTextField(
                  text: "Your password",
                  valFunc: passwordValidator,
                  controllerName: _pass,
                ),
                RoundButton(
                  text: "Sign Up",
                  press: () {
                    if (formKey.currentState!.validate()) {
                      showLoading(context);
                      _createUserEmail(context);
                    }
                  },
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
                        Navigator.pushReplacement(
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
      ),
    );
  }

  Future _createUserEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), password: _pass.text.trim());
      await FirebaseAuth.instance.currentUser!.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        Navigator.pop(context);
        showMyDialog("Email id already in use", context);
        return;
      } else {
        Navigator.pop(context);
        showMyDialog("Something went wrong", context);
        return;
      }
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false);
  }
}
