import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_list/models/category.dart';

void main() {
  group('Category Model Tests', () {
    test('should create a Category with title and color', () {
      // Arrange & Act
      const category = Category('Vegetables', Colors.green);

      // Assert
      expect(category.title, 'Vegetables');
      expect(category.color, Colors.green);
    });

    test('should create different categories with different properties', () {
      // Arrange & Act
      const vegetables = Category('Vegetables', Colors.green);
      const dairy = Category('Dairy', Colors.blue);
      const meat = Category('Meat', Colors.red);

      // Assert
      expect(vegetables.title, 'Vegetables');
      expect(vegetables.color, Colors.green);

      expect(dairy.title, 'Dairy');
      expect(dairy.color, Colors.blue);

      expect(meat.title, 'Meat');
      expect(meat.color, Colors.red);
    });

    test('should maintain immutability', () {
      // Arrange
      const category = Category('Test Category', Colors.purple);

      // Assert - properties should be final
      expect(category.title, isA<String>());
      expect(category.color, isA<Color>());
    });
  });

  group('Categories Enum Tests', () {
    test('should have all expected category types', () {
      // Act & Assert
      expect(Categories.values, contains(Categories.vegetables));
      expect(Categories.values, contains(Categories.fruit));
      expect(Categories.values, contains(Categories.meat));
      expect(Categories.values, contains(Categories.dairy));
      expect(Categories.values, contains(Categories.carbs));
      expect(Categories.values, contains(Categories.sweets));
      expect(Categories.values, contains(Categories.spices));
      expect(Categories.values, contains(Categories.convenience));
      expect(Categories.values, contains(Categories.hygiene));
      expect(Categories.values, contains(Categories.other));
    });

    test('should have exactly 10 category types', () {
      // Act & Assert
      expect(Categories.values.length, 10);
    });
  });
}
