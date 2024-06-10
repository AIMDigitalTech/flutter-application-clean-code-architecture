import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_parent_view.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/di/injection_container.dart';

FutureOr<void> main() async {
  // Root Widget/Parent widget of the application
  initDI();
  Bloc.observer = CubitObserver();
  runApp(const AppParentView());
}
