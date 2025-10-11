// Integration tests for the main Grocery List app
//
// These tests verify that the complete app works correctly, including
// the MaterialApp setup, theming, and navigation to the grocery list.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:grocery_list/main.dart';

void main() {
  group('Grocery List App Integration Tests', () {
    testWidgets('should display the grocery list app correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app bar is displayed with correct title
      expect(find.text('Grocery List'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);

      // Verify that grocery items from mock data are displayed
      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('Bananas'), findsOneWidget);
      expect(find.text('Beef Steak'), findsOneWidget);
    });

    testWidgets('should have dark theme applied', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the MaterialApp has the correct theme
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, isNotNull);
      expect(materialApp.theme!.brightness, Brightness.dark);
    });

    testWidgets('should display grocery items with quantities', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify quantities are displayed
      expect(find.text('1'), findsNWidgets(2)); // Milk and Beef Steak
      expect(find.text('5'), findsOneWidget); // Bananas
    });

    testWidgets('should display color indicators for categories', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that color containers are present (one for each grocery item)
      expect(find.byType(Container), findsAtLeastNWidgets(3));
    });

    testWidgets('should have correct app title', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify the MaterialApp title
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, 'Flutter Groceries');
    });

    testWidgets('should handle scrolling in the grocery list', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that ListView is present and scrollable
      expect(find.byType(ListView), findsOneWidget);

      // Try scrolling (should not throw any errors)
      await tester.drag(find.byType(ListView), const Offset(0, -100));
      await tester.pump();

      // Verify no exceptions occurred
      expect(tester.takeException(), isNull);
    });
  });
}
