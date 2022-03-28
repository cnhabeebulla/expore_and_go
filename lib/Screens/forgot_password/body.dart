import 'package:explore_and_go_application/Screens/SignUp/components/background.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:explore_and_go_application/components/round_text_input_field.dart';
import 'package:explore_and_go_application/functions/validation.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to provide the height and width of screen based on the Screen ratio
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _pass = TextEditingController();


    return Background(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(bottom: size.height * 0.03),
        alignment: Alignment.bottomCenter,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                 TextFieldConatiner(icon: Icons.email, text: "Enter email",
                valFunc: emailValidator,
                controller: _email,),
                
                RoundButton(
                  text: "Sign In",
                  press: () {
                    formKey.currentState!.validate();
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
