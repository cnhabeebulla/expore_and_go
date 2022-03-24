import 'package:flutter/material.dart';
import 'package:explore_and_go_application/constants.dart';

class TextFieldConatiner extends StatelessWidget {
  final IconData icon;
  final String text;
  const TextFieldConatiner({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: TextField(
        style: const TextStyle(
          height: 1.6,
        ),
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(
            icon,
            color: primaryColor,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          hintText: text,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
