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
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.close,
              color: primaryColor,
              size: 35,
            ),
          ),
          child
        ],
      ),
    );
  }
}
