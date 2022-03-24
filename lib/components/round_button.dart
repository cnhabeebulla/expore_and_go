import 'package:flutter/material.dart';
import 'package:explore_and_go_application/constants.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback press; // voidCallBack is void Function
  final Color color, textColor;
  final Gradient gradient;
  final double width;
  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
    this.width = 1,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor2,
              primaryColor,
            ],
          ),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      width: size.width * width,
      height: size.height * 0.070,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: press,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
