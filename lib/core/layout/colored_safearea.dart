import 'package:flutter/material.dart';

import '../../config/flavors.dart';
import '../util/theme.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;
  final Color? color;
  final bool? showBanner;

  const ColoredSafeArea(
      {super.key,
      required this.child,
      this.color = onPrimaryColor,
      this.showBanner});

  @override
  Widget build(BuildContext context) {
    return showBanner ?? false
        ? Banner(
            message: F.name,
            location: BannerLocation.topStart,
            color: Colors.blue.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
            child: safeWidget(context),
          )
        : safeWidget(context);
  }

  Widget safeWidget(BuildContext context) {
    return Container(
        color: color ?? Theme.of(context).appBarTheme.backgroundColor,
        child: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: child,
          ),
        ));
  }
}
