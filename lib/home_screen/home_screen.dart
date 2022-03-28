import 'package:explore_and_go_application/Screens/Welcome/welcome_screen.dart';
import 'package:explore_and_go_application/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      _signOutEmail();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                          (route) => false);
                    }),
              ),
            ]),
      ),
    );
  }

  Future<void> _signOutEmail() async {
    await FirebaseAuth.instance.signOut();
  }
}
