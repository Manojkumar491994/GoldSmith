import 'package:e_gold/LoginScreen.dart';
import 'package:e_gold/Navigation/ScreenA.dart';
import 'package:e_gold/controller/CounterModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Getapi.dart';
import 'MethiodChannel/Batery.dart';
import 'Navigation/Navigation.dart';
import 'Packages/MyFitaCal.dart';
import 'SQlite/sqllite.dart';
import 'SplashScreen.dart';
import 'cartPAge.dart';
import 'chatsandtables/charts_tables.dart';
import 'controller/api_provider.dart';
import 'firebase/Firebase.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
    providers: [
     ChangeNotifierProvider(create: (context) => ProductsProvider()),
     ChangeNotifierProvider(create: (context) => CounterModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => SplashScreen(),
        '/DetailPage': (context) => ScreenA(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        primaryColorDark: Colors.yellowAccent,
        primaryColorLight: Colors.green,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetProducts(),
    );
  }
}
