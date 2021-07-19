import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_codelab/models/favorites.dart';

void main() {
  group("Testing App Provider", () {
    Favorites favorites = Favorites();
    test("A new item should be added", () {
      int number = 16;

      favorites.add(number);
      expect(favorites.items.contains(number), true);
    });

    test("A new item should be removed", () {
      int number = 17;

      favorites.add(number);
      expect(favorites.items.contains(number), true);

      favorites.remove(number);
      expect(favorites.items.contains(number), false);
    });
  });
}
