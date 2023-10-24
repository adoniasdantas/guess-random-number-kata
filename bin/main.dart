import 'dart:io';

import 'package:dart_test/random_number_game.dart';

void main() {
  final game = RandomNumberGame();

  while (game.remainingAttempts > 0) {
    print(game.message);
    final input = stdin.readLineSync();
    final number = int.tryParse(input!);
    if (number != null) {
      game.guessNumber(number);
    }
  }

  print(game.message);
}
