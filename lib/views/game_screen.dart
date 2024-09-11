import 'package:flutter/material.dart';
import '../widgets/game_button.dart';
import '../widgets/score_board.dart';

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

  String getRandomChoice() {
    List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
    choices.shuffle();
    return choices.first;
  }

  String getResult(String player, String computer) {
    if (player == computer) return 'Empate';
    if ((player == 'Pedra' && computer == 'Tesoura') ||
        (player == 'Papel' && computer == 'Pedra') ||
        (player == 'Tesoura' && computer == 'Papel')) {
      return 'Você Ganhou';
    }
    return 'Você Perdeu';
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
        backgroundColor: Colors.green, 
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
