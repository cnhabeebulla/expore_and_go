import 'package:explore_and_go_application/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8, // to add a padding from scrren both side
      child: Row(
        children: const [
          BuildDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "OR",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: lightTextColor,
              ),
            ),
          ),
          BuildDivider()
        ],
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        color: Colors.black54,
        height: 2.0,
        thickness: 1.0,
      ),
    );
  }
}
