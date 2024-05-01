import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/splash/splash_page.dart';
import '../bloc/network_cubit.dart';
import '../const/route_constants.dart';
import '../di/injection_container.dart';

class RouteNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final routesList = {
    RoutesList.initialRoute: (context) => const SplashPage(),
    RoutesList.loginRoute: (context) => const LoginPage(),
    RoutesList.homeRoute: (context) => const HomePage(),
    RoutesList.searchRoute: (context) => const SearchPage(),
  };

  static Future<dynamic>? pushNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? pushRepalcementNamed<Arguments>(
      {required String routeName, Arguments? arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static List<Route<dynamic>> defaultGenerateInitialRoutes(
      String initialRouteName) {
    List<MaterialPageRoute> routes = [];
    routes
        .add(MaterialPageRoute(builder: routesList[RoutesList.initialRoute]!));
    return routes;
  }

  static Route<dynamic> generateNamedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesList.initialRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<NetworkCubit>(
                  create: (_) => serviceLocator<NetworkCubit>()),
            ], child: const SplashPage()),
          );
        }
      case RoutesList.loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: const LoginPage()),
          );
        }
      case RoutesList.homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: const HomePage()),
          );
        }

      case RoutesList.searchRoute:
        {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider<LoginCubit>(
                  create: (_) => serviceLocator<LoginCubit>()),
            ], child: const SearchPage()),
          );
        }
      default:
        throw Exception('This route name does not exit');
    }
  }
}
