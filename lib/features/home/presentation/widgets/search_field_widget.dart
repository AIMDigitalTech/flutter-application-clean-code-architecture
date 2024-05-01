import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/const/route_constants.dart';
import '../../../../core/routing/routes.dart';
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
        RouteNavigator.pushNamed(routeName: RoutesList.searchRoute);
      },
    );
  }
}
