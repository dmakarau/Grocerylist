import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_item.dart';

class GroceryItemTile extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryItemTile({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text('${groceryItem.quantity}'),
    );
  }
}
