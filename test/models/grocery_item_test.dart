import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/category.dart';
import 'package:grocery_list/models/grocery_item.dart';

void main() {
  group('GroceryItem Model Tests', () {
    test('should create a GroceryItem with all required properties', () {
      // Arrange
      const category = Category('Test Category', Colors.red);
      
      // Act
      const groceryItem = GroceryItem(
        id: 'test-id',
        name: 'Test Item',
        quantity: 5,
        category: category,
      );

      // Assert
      expect(groceryItem.id, 'test-id');
      expect(groceryItem.name, 'Test Item');
      expect(groceryItem.quantity, 5);
      expect(groceryItem.category, category);
    });

    test('should create a GroceryItem with different quantities', () {
      // Arrange
      const category = Category('Dairy', Colors.blue);
      
      // Act & Assert
      const item1 = GroceryItem(id: '1', name: 'Milk', quantity: 1, category: category);
      const item2 = GroceryItem(id: '2', name: 'Cheese', quantity: 10, category: category);
      
      expect(item1.quantity, 1);
      expect(item2.quantity, 10);
    });

    test('should maintain immutability', () {
      // Arrange
      const category = Category('Fruit', Colors.green);
      const groceryItem = GroceryItem(
        id: 'fruit-1',
        name: 'Apple',
        quantity: 3,
        category: category,
      );

      // Assert - properties should be final
      expect(groceryItem.id, isA<String>());
      expect(groceryItem.name, isA<String>());
      expect(groceryItem.quantity, isA<int>());
      expect(groceryItem.category, isA<Category>());
    });
  });
}