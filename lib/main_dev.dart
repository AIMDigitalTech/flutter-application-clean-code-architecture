import 'package:flutter/material.dart';
import 'config/flavors.dart';
import 'main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  F.appFlavor = Flavor.dev;
  // setup dev.
  await runner.main();
}
