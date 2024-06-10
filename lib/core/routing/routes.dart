import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/splash/splash_page.dart';
import '../bloc/network_cubit.dart';
import '../di/injection_container.dart';

class RouteNavigator {
  // GoRouter configuration
  static final GoRouter routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<NetworkCubit>(
                create: (_) => serviceLocator<NetworkCubit>()),
            BlocProvider<LoginCubit>(
                create: (_) => serviceLocator<LoginCubit>()),
          ],
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<NetworkCubit>(
                create: (_) => serviceLocator<NetworkCubit>()),
            BlocProvider<LoginCubit>(
                create: (_) => serviceLocator<LoginCubit>()),
          ],
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<NetworkCubit>(
                create: (_) => serviceLocator<NetworkCubit>()),
            BlocProvider<LoginCubit>(
                create: (_) => serviceLocator<LoginCubit>()),
          ],
          child: const HomePage(),
        ),
      ),
    ],
  );
}
