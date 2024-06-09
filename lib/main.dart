// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Screens/home_screen/screens/home_screen.dart';
import 'Screens/splash_screen/SplashScrren.dart';
import 'controllers/auth/Login.dart';
import 'controllers/auth/register.dart';
import 'controllers/categories_provider/categories.dart';
import 'controllers/invoice_provider/invoice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => Login_Provider()),
  ChangeNotifierProvider(create: (ctx) => Register_Provider()),
  ChangeNotifierProvider(create: (ctx) => Categories_Provider()),
  ChangeNotifierProvider(create: (ctx) => Invoice_Provider()),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return ChangeNotifierProvider(
        create: (ctx) => Categories_Provider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,

          navigatorObservers: [FlutterSmartDialog.observer],
          // here
          builder: FlutterSmartDialog.init(),
          // home: const SplashScreen(),
          home: const HomeScreen(),
        ),
      );
    });
  }
}


  //  ElevatedButton(
  //                             onPressed: () {
  //                               //

  //                               // _futureData = Api().fetchData(context);

  //                               print(provCategory.model_items[0][0].name);

  //                               print(provCategory.model_group[0]);
  //                             },
  //                             child: const Text('data'),
  //                           ),


// Administrator
// JT8r!HKmJX9D