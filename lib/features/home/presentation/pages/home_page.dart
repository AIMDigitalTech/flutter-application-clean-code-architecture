import 'package:flutter/material.dart';

import '../../../../core/layout/colored_safearea.dart';
import '../../../../core/util/theme.dart';
import '../widgets/header_menu_widget.dart';
import '../widgets/search_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
              top: kPaddingS, left: kPaddingS, right: kPaddingS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderMenuWidget(),
              const SizedBox(
                height: kSpaceS,
              ),
              Text(
                'We will deliver in 30 minutes',
                style: subTitle2,
              ),
              const SizedBox(
                height: kSpaceM,
              ),
              const SearchFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
