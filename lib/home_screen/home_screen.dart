import 'package:explore_and_go_application/Screens/Welcome/welcome_screen.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/create_password/create_password_screen.dart';
import '../functions/google_sign_in.dart';
import '../functions/helper_function.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // String? email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Signed as : ${FirebaseAuth.instance.currentUser!.email}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                width: size.width * 0.6,
                child: RoundButton(
                    text: "Logout",
                    press: () {
                      //TO-DO
                      //confirm sign out properly executed and signed out
                      _signOutEmail(context);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                          (route) => false);
                    }),
              ),
              SizedBox(
                width: size.width * 0.6,
                child: RoundButton(
                    text: "change password",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChangePassword();
                          },
                        ),
                      );
                    }),
              ),
            ]),
      ),
    );
  }

  Future<void> _signOutEmail(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser!.providerData[0].providerId ==
        'google.com') {
      try {
        final provider =
            Provider.of<GoogleSignInMethod>(context, listen: false);
        provider.googleLogout();
        await FirebaseAuth.instance.signOut();
      } on FirebaseAuthException catch (e) {
        showMyDialog(e.code, context);
      }
    } else {
      //print(FirebaseAuth.instance.currentUser!.providerData[0].providerId);
      await FirebaseAuth.instance.signOut();
    }
  }
}
