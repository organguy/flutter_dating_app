import 'package:dating_app/config/theme.dart';
import 'package:dating_app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
        )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const HomeScreen(),
    );
  }
}
