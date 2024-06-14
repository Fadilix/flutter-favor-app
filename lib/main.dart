import 'package:flutter/material.dart';
import 'package:flutter_favor_app/pages/home_pag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade200),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
