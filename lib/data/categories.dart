import 'package:flutter/material.dart';

import 'package:grocery_list/models/category.dart';

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color(0xFF4CAF50), // Fresh green
  ),
  Categories.fruit: Category('Fruit', Color(0xFFFF9800)), // Vibrant orange
  Categories.meat: Category('Meat', Color(0xFFE53935)), // Rich red
  Categories.dairy: Category('Dairy', Color(0xFF2196F3)), // Clear blue
  Categories.carbs: Category('Carbs', Color(0xFF8D6E63)), // Warm brown
  Categories.sweets: Category('Sweets', Color(0xFFE91E63)), // Sweet pink
  Categories.spices: Category('Spices', Color(0xFF689F38)), // Herb green
  Categories.convenience: Category(
    'Convenience',
    Color(0xFF9C27B0), // Royal purple
  ),
  Categories.hygiene: Category('Hygiene', Color(0xFF00BCD4)), // Clean cyan
  Categories.other: Category('Other', Color(0xFF607D8B)), // Neutral slate
};
