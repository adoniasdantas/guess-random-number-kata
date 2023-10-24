import 'dart:math';

enum GameState {
  playing,
  win,
  loss,
}

class RandomNumberGame {
  int remainingAttempts;
  int number;
  String numberPosition;
  GameState state;
  String message;

  RandomNumberGame()
      : number = Random().nextInt(10) + 1,
        remainingAttempts = 3,
        numberPosition = '',
        state = GameState.playing,
        message = 'Guess a number';

  RandomNumberGame._(this.remainingAttempts, this.number, this.numberPosition, this.state, this.message);

  RandomNumberGame copy({
    int? remainingAttempts,
    int? number,
    String? numberPosition,
    GameState? state,
    String? message,
  }) {
    return RandomNumberGame._(
      remainingAttempts ?? this.remainingAttempts,
      number ?? this.number,
      numberPosition ?? this.numberPosition,
      state ?? this.state,
      message ?? this.message,
    );
  }

  void guessNumber(int number) {
    if (number != this.number) {
      remainingAttempts = remainingAttempts - 1;
      if (remainingAttempts == 0) {
        state = GameState.loss;
        message = 'You lose :(';
        return;
      }
      numberPosition = this.number > number ? '+' : '-';
      message = "The number is ${numberPosition == '+' ? 'higher' : 'lower'}";
      return;
    }
    remainingAttempts = 0;
    message = 'Congratulations. You win';
    state = GameState.win;
  }
}
