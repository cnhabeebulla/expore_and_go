import 'package:explore_and_go_application/Screens/create_password/create_password_screen.dart';
import 'package:explore_and_go_application/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChangePassword();
                    },
                  ),
                );
              },
              child: Icon(
                Icons.close,
                color: primaryColor,
                size: size.width * 0.0778,
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
