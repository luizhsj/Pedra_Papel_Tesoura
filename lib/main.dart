import 'package:flutter/material.dart';
import 'views/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GameScreen(),
    );
  }
}