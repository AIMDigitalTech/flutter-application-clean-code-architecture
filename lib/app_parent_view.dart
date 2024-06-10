import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routing/routes.dart';
import 'core/util/constant.dart';
import 'core/util/theme.dart';

class AppParentView extends StatefulWidget {
  const AppParentView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppParentViewState();
  }
}

class _AppParentViewState extends State<AppParentView> {
  // Adding English and Arabic support.
  var supportedLocales = [const Locale('en', ''), const Locale('ar', '')];

  // static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteNavigator.routerConfig,
      supportedLocales: supportedLocales,
      title: 'AIM Digital',
      theme: lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
    );
  }

  // Define an async function to
  // initialize FlutterFire
  // Firebase Crashlytics initialization.
  Future<void> _initializeFlutterFire() async {
    // Wait for Firebase to initialize
    if (kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
    // Pass all uncaught errors to Crashlytics.
    Function originalOnError = FlutterError.onError as Function;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      originalOnError(errorDetails);
    };
  }
}
