import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:what_plant_midterm/firebase_options.dart';
import 'date_selection_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatPlant App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DateSelectionScreen(),
    );
  }
}
