import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/category.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';

void main() {
  group('GroceryItemTile Widget Tests', () {
    testWidgets('should display grocery item name, color, and quantity', (WidgetTester tester) async {
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
          home: Scaffold(
            body: GroceryItemTile(groceryItem: groceryItem),
          ),
        ),
      );

      // Assert
      expect(find.text('Milk'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      
      // Check if the color container exists
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GroceryItemTile),
          matching: find.byType(Container),
        ),
      );
      expect(container.color, Colors.blue);
    });

    testWidgets('should display different grocery items correctly', (WidgetTester tester) async {
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
          home: Scaffold(
            body: GroceryItemTile(groceryItem: groceryItem),
          ),
        ),
      );

      // Assert
      expect(find.text('Bananas'), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
      
      // Check if the color container has the correct color
      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(GroceryItemTile),
          matching: find.byType(Container),
        ),
      );
      expect(container.color, Colors.green);
    });

    testWidgets('should have correct layout structure', (WidgetTester tester) async {
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
          home: Scaffold(
            body: GroceryItemTile(groceryItem: groceryItem),
          ),
        ),
      );

      // Assert
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      
      // Verify the structure: ListTile with leading Container and trailing Text
      final listTile = tester.widget<ListTile>(find.byType(ListTile));
      expect(listTile.leading, isA<Container>());
      expect(listTile.trailing, isA<Text>());
      expect(listTile.title, isA<Text>());
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
          home: Scaffold(
            body: GroceryItemTile(groceryItem: groceryItem),
          ),
        ),
      );

      // Assert
      expect(find.text('Very Long Grocery Item Name That Might Overflow'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      
      // Verify no overflow errors
      expect(tester.takeException(), isNull);
    });
  });
}