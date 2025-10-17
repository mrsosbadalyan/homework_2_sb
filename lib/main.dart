import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/exercise1_page.dart';
import 'pages/exercise2_page.dart';
import 'pages/exercise3_page.dart';
import 'pages/exercise4_page.dart';
import 'pages/exercise5_page.dart';
import 'pages/exercise6_page.dart';
import 'pages/exercise7_page.dart';
import 'pages/exercise8_page.dart';
import 'pages/exercise9_page.dart';
import 'pages/exercise10_page.dart';

void main() {
  runApp(const Homework2SBApp());
}

class Homework2SBApp extends StatelessWidget {
  const Homework2SBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 2 SB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/ex1': (_) => const Exercise1Page(),
        '/ex2': (_) => const Exercise2Page(),
        '/ex3': (_) => const Exercise3Page(),
        '/ex4': (_) => const Exercise4Page(),
        '/ex5': (_) => const Exercise5Page(),
        '/ex6': (_) => const Exercise6Page(),
        '/ex7': (_) => const Exercise7Page(),
        '/ex8': (_) => const Exercise8Page(),
        '/ex9': (_) => const Exercise9Page(),
        '/ex10': (_) => const Exercise10Page(),
      },
    );
  }
}
