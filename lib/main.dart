// ignore_for_file: prefer_const_constructors

import 'package:api_http_get/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Api http fetch data'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: HomePage(),
      ),
    );
  }
}
