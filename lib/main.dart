// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'Screens/home_screen/home_screen.dart';
import 'Screens/splash_screen/SplashScrren.dart';
import 'controllers/categories_provider/categories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => Categories_Provider()),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Categories_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        navigatorObservers: [FlutterSmartDialog.observer],
        // here
        builder: FlutterSmartDialog.init(),
        home: const SplashScreen(),
        // home: const HomeScreen(),
      ),
    );
  }
}
