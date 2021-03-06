import 'package:flutter/material.dart';

//Function to check wetaher user already linked with email
// static Future<bool> isEmailLinked(String text) async {
//   if (FirebaseAuth.instance.isSignInWithEmailLink(text)) {
//     print("yes linked");
//     return true;
//   } else {
//     print("not linked");
//     return false;
//   }
// }

//Function to create a spinning loading screen
Future<void> showLoading(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
}

//function to  create a alert boxes
Future<void> showMyDialog(String message, BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title:const Text("Login failed"),
        content: SingleChildScrollView(
          child: Text(message),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
