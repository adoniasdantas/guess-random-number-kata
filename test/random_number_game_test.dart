import 'package:dart_test/random_number_game.dart';
import 'package:test/test.dart';

void main() {
  group('Random Number Game |', () {
    group('Game Values |', () {
      test('Should init with correct values |', () {
        final sut = RandomNumberGame();

        expect(sut.number, isPositive);
        expect(sut.remainingAttempts, 3);
        expect(sut.state, GameState.playing);
        expect(sut.message, 'Guess a number');
      });

      test('Should decrease the number of attempts if guess the wrong number', () {
        final sut = RandomNumberGame().copy(number: 9);

        sut.guessNumber(8);

        expect(sut.remainingAttempts, 2);
        expect(sut.state, GameState.playing);
      });

      test('Should decrease the number of attempts after every attempt', () {
        final sut = RandomNumberGame().copy(number: 9);

        sut.guessNumber(3);
        expect(sut.remainingAttempts, 2);
        sut.guessNumber(5);
        expect(sut.remainingAttempts, 1);
        sut.guessNumber(7);

        expect(sut.remainingAttempts, 0);
        expect(sut.state, GameState.loss);
      });

      test('Should change numberPosition to - if the guess is bigger than the correct number', () {
        final sut = RandomNumberGame().copy(number: 5);

        sut.guessNumber(8);

        expect(sut.numberPosition, '-');
        expect(sut.state, GameState.playing);
        expect(sut.message, 'The number is lower');
      });

      test('Should change numberPosition to + if the guess is bigger than the correct number', () {
        final sut = RandomNumberGame().copy(number: 5);

        sut.guessNumber(2);

        expect(sut.numberPosition, '+');
        expect(sut.state, GameState.playing);
        expect(sut.message, 'The number is higher');
      });

      test('Should end the game after 3 wrong guesses', () {
        final sut = RandomNumberGame().copy(number: 7, remainingAttempts: 1);

        sut.guessNumber(3);

        expect(sut.state, GameState.loss);
        expect(sut.message, 'You lose :(');
      });

      test('Should end the game after correct guess', () {
        final sut = RandomNumberGame().copy(number: 7);

        sut.guessNumber(7);

        expect(sut.state, GameState.win);
        expect(sut.message, 'Congratulations. You win');
      });
    });
  });
}
