import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color splashColor;
  final textColor;
  final highlightColor;
  final fillColor;

  const LoginButton(
      {required Key key,
      required this.text,
      @required this.textColor,
      required this.splashColor,
      @required this.fillColor,
      @required this.highlightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
