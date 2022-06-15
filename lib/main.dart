import 'package:flutter/material.dart';
import 'package:hackathon/Screens/medicalstatus.dart';

void main() {
  runApp(MaterialApp(
    home: const MyHomePage(),
    routes: {
      '/home': (context) => const MyHomePage(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
