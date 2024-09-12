import 'dart:math';

String getRandomChoice() {
  List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
  return choices[Random().nextInt(choices.length)];
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
