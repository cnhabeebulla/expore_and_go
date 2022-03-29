import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  const CustomRaisedButton({
    required this.child,
    this.color = Colors.white,
    this.borderRadius = 6,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class SignInButton extends CustomRaisedButton {
  SignInButton({
    required String text,
    Color color = Colors.white,
    Color textColor = Colors.black87,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ), // Text
          color: color,
          onPressed: onPressed,
        );
}
