import 'package:calculadora_imc/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.green,
        textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
            bodyText1: TextStyle(
              color: Colors.green,
            ),
            subtitle1: TextStyle(
              color: Colors.green,
            )),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            decorationColor: Colors.green,
            color: Colors.green,
          ),
        ),
      ),
      home: Home(),
    );
  }
}
