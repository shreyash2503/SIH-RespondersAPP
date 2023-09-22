import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responders/constants/color.dart';
import './screens/chatscreen.dart';
import 'screens/chatSpace.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'ToDo App',
      home: ChatScreen(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}