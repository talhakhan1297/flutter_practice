import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp UI Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        indicatorColor: Colors.white,
        primaryColorDark: const Color(0xFF128C7E),
      ),
      home: const Home(),
    );
  }
}
