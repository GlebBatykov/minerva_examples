import 'dart:math';

class RandomStringGenerator {
  final Random _random = Random();

  String generate(int length) {
    const dictionary =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    return List.generate(
            length, (index) => dictionary[_random.nextInt(dictionary.length)])
        .join();
  }
}
