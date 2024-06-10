import 'package:flutter/foundation.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  SimpleConnectionChecker get simpleConnectionChecker;
}

class NetworkInfoImpl extends NetworkInfo {
  NetworkInfoImpl();

  @override
  Future<bool> get isConnected async {
    if (!kIsWeb) {
      return await SimpleConnectionChecker.isConnectedToInternet();
    } else {
      return true;
    }
  }

  @override
  SimpleConnectionChecker get simpleConnectionChecker =>
      SimpleConnectionChecker();
}
