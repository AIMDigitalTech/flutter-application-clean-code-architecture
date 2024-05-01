import 'package:flutter/material.dart';

Widget inputWidget(Icon icon, String hint, TextEditingController controller,
    bool obscure, BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30, right: 10),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
          )),
    ),
  );
}
