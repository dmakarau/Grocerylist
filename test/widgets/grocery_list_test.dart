import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/widgets/grocery_list.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';
import 'package:grocery_list/widgets/new_item.dart';

void main() {
  group('GroceryList Widget Tests', () {
    testWidgets('should display app bar with correct title and add button', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Assert
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should display empty state message when no items', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Assert - Should show empty state since mock_items.dart was removed
      expect(find.text('No items added yet.'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('should navigate to NewItem screen when add button is tapped', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Add New Item'), findsOneWidget);
      expect(find.byType(NewItem), findsOneWidget);
    });

    testWidgets('should add item to list when returning from NewItem', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Act - Navigate to NewItem screen
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Fill in the form
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.enterText(find.byType(TextFormField).last, '2');

      // Submit the form
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Assert - Should be back on grocery list with new item
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.text('Test Item'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.byType(GroceryItemTile), findsOneWidget);
      expect(find.text('No items added yet.'), findsNothing);
    });

    testWidgets('should display list view when items are present', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add an item first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('No items added yet.'), findsNothing);
    });

    testWidgets('should wrap items in Dismissible widgets', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add an item first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(Dismissible), findsOneWidget);
      expect(find.byType(GroceryItemTile), findsOneWidget);
    });

    testWidgets('should show delete background when swiping item', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add an item first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Act - Start swiping (but don't complete dismissal)
      await tester.drag(find.byType(Dismissible), const Offset(-100, 0));
      await tester.pump();

      // Assert - Delete icon should be visible in background
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });

    testWidgets('should remove item when swiped to dismiss', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add an item first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Verify item is present
      expect(find.text('Test Item'), findsOneWidget);

      // Act - Swipe to dismiss
      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Assert - Item should be removed and empty state should show
      expect(find.text('Test Item'), findsNothing);
      expect(find.text('No items added yet.'), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('should add multiple items and display them all', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add first item
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'First Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Add second item
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Second Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('First Item'), findsOneWidget);
      expect(find.text('Second Item'), findsOneWidget);
      expect(find.byType(GroceryItemTile), findsNWidgets(2));
      expect(find.byType(Dismissible), findsNWidgets(2));
    });

    testWidgets('should not add item when canceling from NewItem screen', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Act - Navigate to NewItem screen and go back
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      // Assert - Should still show empty state
      expect(find.text('No items added yet.'), findsOneWidget);
      expect(find.byType(GroceryItemTile), findsNothing);
    });

    testWidgets('should handle scrolling when many items are present', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add multiple items
      for (int i = 1; i <= 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextFormField).first, 'Item $i');
        await tester.tap(find.text('Add Item'));
        await tester.pumpAndSettle();
      }

      // Assert - ListView should be present and scrollable
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(GroceryItemTile), findsNWidgets(3));

      // Try scrolling - should not throw any errors
      await tester.drag(find.byType(ListView), const Offset(0, -100));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });

    testWidgets('should use correct dismiss direction', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(const MaterialApp(home: GroceryList()));

      // Add an item
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Act & Assert - Swiping left should work (endToStart)
      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();
      expect(find.text('Test Item'), findsNothing);
    });
  });
}
