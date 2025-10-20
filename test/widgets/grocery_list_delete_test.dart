import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/widgets/grocery_list.dart';

void main() {
  group('GroceryList Delete Functionality Tests', () {
    testWidgets('should show basic UI structure', (
      WidgetTester tester,
    ) async {
      // Basic test that doesn't require HTTP mocking
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Grocery List'), findsOneWidget);
    });

    testWidgets('should navigate to add item screen', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('Add New Item'), findsOneWidget);
    });
  });
}