// Integration tests for the main Grocery List app
//
// These tests verify that the complete app works correctly, including
// the MaterialApp setup, theming, navigation, and the full add/delete workflow.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grocery_list/main.dart';

void main() {
  group('Grocery List App Integration Tests', () {
    testWidgets(
      'should display the grocery list app correctly with empty state',
      (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const MyApp());

        // Verify that the app bar is displayed with correct title
        expect(find.text('Grocery List'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);

        // Verify that empty state is shown (since mock_items.dart was removed)
        expect(find.text('No items added yet.'), findsOneWidget);

        // Verify add button is present
        expect(find.byIcon(Icons.add), findsOneWidget);
      },
    );

    testWidgets('should have automatic theme support', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the MaterialApp has both light and dark themes configured
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, isNotNull);
      expect(materialApp.darkTheme, isNotNull);
      expect(materialApp.theme!.brightness, Brightness.light);
      expect(materialApp.darkTheme!.brightness, Brightness.dark);
      expect(materialApp.themeMode, ThemeMode.system);
    });

    testWidgets('should have correct app title', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify the MaterialApp title
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'Flutter Groceries');
    });

    testWidgets('complete add item workflow integration test', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify initial empty state
      expect(find.text('No items added yet.'), findsOneWidget);

      // Tap add button to navigate to NewItem screen
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Verify we're on the NewItem screen
      expect(find.text('Add New Item'), findsOneWidget);

      // Fill in the form
      await tester.enterText(
        find.byType(TextFormField).first,
        'Integration Test Item',
      );
      await tester.enterText(find.byType(TextFormField).last, '3');

      // Submit the form
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Verify we're back on the grocery list with the new item
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.text('Integration Test Item'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('No items added yet.'), findsNothing);
    });

    testWidgets('complete delete item workflow integration test', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Add an item first
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byType(TextFormField).first,
        'Item to Delete',
      );
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Verify item is present
      expect(find.text('Item to Delete'), findsOneWidget);

      // Swipe to delete the item
      await tester.drag(find.byType(Dismissible), const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify item is deleted and empty state returns
      expect(find.text('Item to Delete'), findsNothing);
      expect(find.text('No items added yet.'), findsOneWidget);
    });

    testWidgets('should handle multiple items workflow', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Add multiple items
      for (int i = 1; i <= 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextFormField).first, 'Item $i');
        await tester.enterText(find.byType(TextFormField).last, '$i');
        await tester.tap(find.text('Add Item'));
        await tester.pumpAndSettle();
      }

      // Verify all items are present
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);

      // Delete one item
      await tester.drag(find.byType(Dismissible).first, const Offset(-500, 0));
      await tester.pumpAndSettle();

      // Verify one item is deleted but others remain
      expect(find.text('Item 2'), findsOneWidget);
      expect(find.text('Item 3'), findsOneWidget);
      expect(find.text('No items added yet.'), findsNothing);
    });

    testWidgets('should handle form validation in add item workflow', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Navigate to add item screen
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Try to submit empty form
      await tester.tap(find.text('Add Item'));
      await tester.pump();

      // Verify validation error is shown
      expect(
        find.text('Must be between 2 and 50 characters long.'),
        findsOneWidget,
      );

      // Verify we're still on the NewItem screen
      expect(find.text('Add New Item'), findsOneWidget);
    });

    testWidgets('should handle cancel workflow from add item screen', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Navigate to add item screen
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      // Go back without adding item
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      // Verify we're back on the grocery list with empty state
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.text('No items added yet.'), findsOneWidget);
    });

    testWidgets('should display category colors correctly', (
      WidgetTester tester,
    ) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Add an item
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'Test Item');
      await tester.tap(find.text('Add Item'));
      await tester.pumpAndSettle();

      // Verify color container is present for the category
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });
  });
}
