import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_codelab/models/favorites.dart';
import 'package:flutter_testing_codelab/screens/favorites.dart';
import 'package:provider/provider.dart';

late Favorites favoritesList;

Widget createFavouritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: MaterialApp(
        home: FavoritesPage(),
      ),
    );

void addItems() {
  for (int i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  group("Favourites Page Widget Test", () {
    testWidgets("Test if ListView shows up", (tester) async {
      await tester.pumpWidget(createFavouritesScreen());
      await tester.pumpAndSettle();
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("Testing Remove Button", (tester) async {
      await tester.pumpWidget(createFavouritesScreen());
      addItems();
      await tester.pumpAndSettle();
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      expect(tester.widgetList(find.byIcon(Icons.close)).length,
          lessThan(totalItems));
      expect(find.text("Removed from favorites."), findsOneWidget);
    });
  });
}
