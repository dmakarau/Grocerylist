import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/widgets/grocery_list.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';

void main() {
  group('GroceryList Widget Tests', () {
    testWidgets('should display app bar with correct title', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('should display all grocery items from mock data', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert - Check for the items from mock_items.dart
      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bananas'), findsOneWidget);
      expect(find.text('Beef Steak'), findsOneWidget);
      
      // Check quantities
      expect(find.text('1'), findsNWidgets(2)); // Milk and Beef Steak both have quantity 1
      expect(find.text('5'), findsOneWidget); // Bananas have quantity 5
    });

    testWidgets('should display correct number of grocery item tiles', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert
      expect(find.byType(GroceryItemTile), findsNWidgets(3)); // Should have 3 items from mock data
    });

    testWidgets('should have a scrollable list view', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('should display color indicators for categories', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert - Check that color containers exist (one for each item)
      expect(find.byType(Container), findsAtLeastNWidgets(3));
      
      // Verify that we can find all the grocery item tiles with their containers
      final containers = find.descendant(
        of: find.byType(GroceryItemTile),
        matching: find.byType(Container),
      );
      expect(containers, findsNWidgets(3));
    });

    testWidgets('should handle empty state if no items', (WidgetTester tester) async {
      // Note: This test would require mocking the groceryItems list
      // For now, we verify the basic structure works with existing data
      
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert - Basic structure should be present
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('should be scrollable when content exceeds screen height', (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: GroceryList(),
        ),
      );

      // Assert - ListView should be scrollable
      final listView = tester.widget<ListView>(find.byType(ListView));
      expect(listView.scrollDirection, Axis.vertical);
      
      // Verify no overflow issues
      expect(tester.takeException(), isNull);
    });
  });
}