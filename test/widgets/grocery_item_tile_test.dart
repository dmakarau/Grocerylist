import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/category.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';

void main() {
  group('GroceryItemTile Widget Tests', () {
    testWidgets('should display grocery item name, color, and quantity', (
      WidgetTester tester,
    ) async {
      // Arrange
      const category = Category('Dairy', Colors.blue);
      const groceryItem = GroceryItem(
        id: 'test-1',
        name: 'Milk',
        quantity: 2,
        category: category,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GroceryItemTile(groceryItem: groceryItem)),
        ),
      );

      // Assert
      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('Dairy'), findsOneWidget); // Category title is displayed

      // Check if the category icon container exists with correct styling
      final categoryContainers = find.descendant(
        of: find.byType(GroceryItemTile),
        matching: find.byType(Container),
      );
      expect(
        categoryContainers,
        findsWidgets,
      ); // Multiple containers in new design

      // Verify Card structure exists
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget); // Category icon
    });

    testWidgets('should display different grocery items correctly', (
      WidgetTester tester,
    ) async {
      // Arrange
      const fruitCategory = Category('Fruit', Colors.green);
      const groceryItem = GroceryItem(
        id: 'test-2',
        name: 'Bananas',
        quantity: 5,
        category: fruitCategory,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GroceryItemTile(groceryItem: groceryItem)),
        ),
      );

      // Assert
      expect(find.text('Bananas'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      expect(find.text('Fruit'), findsOneWidget);

      // Check for the fruit icon (apple icon for fruit category)
      expect(find.byIcon(Icons.apple), findsOneWidget);

      // Verify Card structure
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      // Arrange
      const category = Category('Meat', Colors.red);
      const groceryItem = GroceryItem(
        id: 'test-3',
        name: 'Beef Steak',
        quantity: 1,
        category: category,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GroceryItemTile(groceryItem: groceryItem)),
        ),
      );

      // Assert - Check for modern Card-based structure
      expect(find.byType(Card), findsOneWidget);
      expect(find.byType(Row), findsOneWidget); // Main layout row
      expect(find.byType(Column), findsOneWidget); // Item details column
      expect(find.byType(Icon), findsOneWidget); // Category icon

      // Verify multiple containers (category indicator + quantity badge)
      final containers = find.descendant(
        of: find.byType(GroceryItemTile),
        matching: find.byType(Container),
      );
      expect(containers, findsWidgets);

      // Verify text elements are present
      expect(find.text('Beef Steak'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Meat'), findsOneWidget);
    });

    testWidgets('should handle edge cases', (WidgetTester tester) async {
      // Arrange - Test with quantity 0 and very long name
      const category = Category('Other', Colors.grey);
      const groceryItem = GroceryItem(
        id: 'test-4',
        name: 'Very Long Grocery Item Name That Might Overflow',
        quantity: 0,
        category: category,
      );

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GroceryItemTile(groceryItem: groceryItem)),
        ),
      );

      // Assert
      expect(
        find.text('Very Long Grocery Item Name That Might Overflow'),
        findsOneWidget,
      );
      expect(find.text('0'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);

      // Verify the modern structure still works with edge cases
      expect(find.byType(Card), findsOneWidget);
      expect(
        find.byIcon(Icons.shopping_cart),
        findsOneWidget,
      ); // Default icon for 'Other'

      // Verify no overflow errors
      expect(tester.takeException(), isNull);
    });

    testWidgets('should display correct icons for different categories', (
      WidgetTester tester,
    ) async {
      // Test vegetables category
      const vegetablesCategory = Category('Vegetables', Colors.green);
      const vegetablesItem = GroceryItem(
        id: 'test-veg',
        name: 'Broccoli',
        quantity: 1,
        category: vegetablesCategory,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: GroceryItemTile(groceryItem: vegetablesItem)),
        ),
      );

      expect(find.byIcon(Icons.local_florist), findsOneWidget);
      expect(find.text('Vegetables'), findsOneWidget);
    });
  });
}
