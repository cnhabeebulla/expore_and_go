import 'package:flutter/material.dart';
import 'package:explore_and_go_application/constants.dart';

class PassowrdTextField extends StatefulWidget {
  final String text;
  const PassowrdTextField({Key? key, required this.text}) : super(key: key);
  @override
  State<PassowrdTextField> createState() => _PassowrdTextFieldState();
}

class _PassowrdTextFieldState extends State<PassowrdTextField> {
  static const IconData icon = Icons.visibility;
  //static const IconData icon_off = Icons.visibility_off;
  bool _isPassowordVisibe = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      child: TextField(
        style: const TextStyle(
          height: 1.6,
        ),
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: IconButton(
            icon: _isPassowordVisibe
                ? const Icon(
                    Icons.visibility,
                    color: lightTextColor,
                    size: 18,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: lightTextColor,
                    size: 18,
                  ),
            onPressed: () => setState(() {
              _isPassowordVisibe = !_isPassowordVisibe;
            }),
            // color: lightTextColor,
          ),
          prefixIcon: const Icon(
            icon,
            color: primaryColor,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          hintText: widget.text,
          border: const OutlineInputBorder(),
        ),
        obscureText: _isPassowordVisibe,
      ),
    );
  }
}
