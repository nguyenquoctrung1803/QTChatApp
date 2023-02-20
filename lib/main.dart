import 'package:flutter/material.dart';
import 'package:flutter_chatapp/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData.dark().copyWith(
        backgroundColor: backgroundColor,
      ),
      home: Text('Hello WhatsApp'),
    );
  }
}
