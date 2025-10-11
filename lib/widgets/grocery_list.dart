import 'package:flutter/material.dart';
import 'package:grocery_list/data/mock_items.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grocery List')),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) =>
            GroceryItemTile(groceryItem: groceryItems[index]),
      ),
    );
  }
}
