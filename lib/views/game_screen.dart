import 'package:flutter/material.dart';
import '/widgets/game_button.dart';
import '/widgets/score_board.dart';
import '/services/game_logic.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int playerScore = 0;
  int computerScore = 0;
  String playerChoice = '';
  String computerChoice = '';
  String result = '';

  void playGame(String choice) {
    setState(() {
      playerChoice = choice;
      computerChoice = getRandomChoice();
      result = getResult(playerChoice, computerChoice);
      updateScore(result);
    });
  }

  void updateScore(String result) {
    if (result == 'Você Ganhou') {
      playerScore++;
    } else if (result == 'Você Perdeu') {
      computerScore++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel, Tesoura'),
        backgroundColor: Colors.green, // Define a cor verde no cabeçalho
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sua Jogada', style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GameButton(choice: 'Pedra', onPressed: () => playGame('Pedra')),
              GameButton(choice: 'Papel', onPressed: () => playGame('Papel')),
              GameButton(choice: 'Tesoura', onPressed: () => playGame('Tesoura')),
            ],
          ),
          SizedBox(height: 20),
          Text('Jogada do Computador', style: TextStyle(fontSize: 18)),
          GameButton(choice: computerChoice, onPressed: null, isDisabled: true),
          SizedBox(height: 20),
          Text('Resultado', style: TextStyle(fontSize: 18)),
          Text(result, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ScoreBoard(playerScore: playerScore, computerScore: computerScore),
        ],
      ),
    );
  }
}
