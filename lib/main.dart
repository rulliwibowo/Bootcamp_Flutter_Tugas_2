import 'package:flutter/material.dart';
import 'package:tugas_2_bmi/view/bmi_data_screen.dart';
import 'constants/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor
        ),
        primarySwatch: Colors.blue,
      ),
      home: const BmiDataScreen()
    );
  }
}


