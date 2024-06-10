import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../core/util/theme.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: TextField(
        decoration: kTextFieldDecoration,
        enabled: false,
      ),
      onTap: () {
        log("Search Icon tap.");
      },
    );
  }
}
