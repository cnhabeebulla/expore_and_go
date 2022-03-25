import 'package:flutter/material.dart';
import 'package:explore_and_go_application/Screens/forgot_password/body.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: Body(),
      ),
    );
  }
}
