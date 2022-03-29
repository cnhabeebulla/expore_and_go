import 'package:explore_and_go_application/Screens/SignUp/components/background.dart';
import 'package:explore_and_go_application/components/password_input_field.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/functions/validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _curPass = TextEditingController();

  Body({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  String? confirmPassword(String val) {
    return _pass.text != val ? "Password miss match" : null;
  }

  @override
  Widget build(BuildContext context) {
    //to provide the height and width of screen based on the Screen ratio
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();

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
                  "Create new password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                PassowrdTextField(
                  text: "Current password",
                  controllerName: _curPass,
                  valFunc: isNull,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                PassowrdTextField(
                  text: "New password",
                  controllerName: _pass,
                  valFunc: passwordValidator,
                ),
                PassowrdTextField(
                  text: "Confirm password",
                  controllerName: _confirmPass,
                  valFunc: confirmPassword,
                ),
                RoundButton(
                  text: "Sign In",
                  press: () async {
                    formKey.currentState!.validate();
                    User? user = FirebaseAuth.instance.currentUser;

                    try {
                      await user?.reauthenticateWithCredential(
                          EmailAuthProvider.credential(
                              email: user.email!, password: _curPass.text));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == "wrong-password") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          //backgroundColor: primaryColor,
                          content: Text("Password incorrect",
                              textAlign: TextAlign.center),
                          duration: Duration(seconds: 3),
                        ));
                        return;
                      }
                    }
                    await user!.updatePassword(_confirmPass.text);
                  },
                  width: 0.6,
                ),
                SizedBox(
                  height: size.height * 0.02,
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
}
