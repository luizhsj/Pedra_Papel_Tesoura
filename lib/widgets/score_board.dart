import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final int playerScore;
  final int computerScore;

  const ScoreBoard({
    required this.playerScore,
    required this.computerScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text('Placar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Você', style: TextStyle(fontSize: 16)),
                  Text('$playerScore', style: TextStyle(fontSize: 32)),
                ],
              ),
              Column(
                children: [
                  Text('PC', style: TextStyle(fontSize: 16)),
                  Text('$computerScore', style: TextStyle(fontSize: 32)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
