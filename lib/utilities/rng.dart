import 'dart:math';

int? randomNumberGenerator(int range) {
  final rng = Random();
  return rng.nextInt(range);
}
