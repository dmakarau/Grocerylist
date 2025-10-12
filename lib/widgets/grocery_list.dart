import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';
import 'package:grocery_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));
    if (newItem == null) {
      return;
    }

    // Check if widget is still mounted before calling setState
    if (!mounted) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text(
                "No items added yet.",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) {
                final item = _groceryItems[index];
                return Dismissible(
                  key: ValueKey(item.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: const Icon(Icons.delete, color: Colors.white, size: 40),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      _groceryItems.removeWhere((it) => it.id == item.id);
                    });
                  },
                  child: GroceryItemTile(groceryItem: item),
                );
              },
            ),
    );
  }
}
