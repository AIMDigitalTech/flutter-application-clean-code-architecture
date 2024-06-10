import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'base_cubit.dart';
import 'network_state.dart';

class NetworkCubit extends BaseCubit<NetworkState> {
  StreamSubscription? subscription;
  SimpleConnectionChecker simpleConnectionChecker = SimpleConnectionChecker();

  NetworkCubit() : super(NetworkInitialState()) {
    if (!kIsWeb) {
      subscription =
          simpleConnectionChecker.onConnectionChange.listen((connected) {
        log("Network onConnectionChange: $connected");
        connected
            ? emit(NetworkConnectedState())
            : emit(NetworkDisConnectedState());
      });
    }
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
