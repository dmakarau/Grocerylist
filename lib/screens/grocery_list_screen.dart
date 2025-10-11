import 'package:flutter/material.dart';
import 'package:grocery_list/data/dummy_items.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: item.category.color,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              title: Text(item.name),
              subtitle: Text(item.category.title),
              trailing: Text(
                '${item.quantity}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}