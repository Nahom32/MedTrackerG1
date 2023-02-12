
import 'package:flutter/material.dart';
import 'package:worldmedicalcenter/ui/add_document.dart';
import 'package:worldmedicalcenter/ui/my_subscripitons.dart';
import 'package:worldmedicalcenter/ui/terms_and_conditions.dart';
import '../ui/Add.dart';
import '../ui/HomePage.dart';
import '../ui/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {"/add": (context) => Add()},
      title: 'World Medical App',
      theme: ThemeData(
        primaryTextTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: "Nunito Sans", fontSize: 10)),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: Splash(),
      home: AddDocument(),
    );
  }
}