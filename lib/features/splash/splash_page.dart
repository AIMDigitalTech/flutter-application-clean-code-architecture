import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/bloc/network_cubit.dart';
import '../../core/bloc/network_state.dart';
import '../../core/const/route_constants.dart';
import '../../core/layout/colored_safearea.dart';
import '../../core/util/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => context.go(RoutesList.loginRoute),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      color: backgroundColor,
      showBanner: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: BlocConsumer<NetworkCubit, NetworkState>(
            builder: (BuildContext context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              const SizedBox(
                height: kSpaceM,
              ),
              Visibility(
                visible: state is NetworkDisConnectedState,
                child: Text(
                  state.message,
                  style: subTitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: kSpaceL,
              )
            ],
          );
        }, listener: (context, state) {
          if (state is NetworkInitialState || state is NetworkConnectedState) {
            return;
          }
          var snackBar = SnackBar(
            content: Text(
              state.message,
              style: subTitle2.copyWith(color: onPrimaryColor),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          log("SplashPageState listener: ${state.message}");
        }),
      ),
    );
  }
}
