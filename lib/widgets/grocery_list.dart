import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_list/config/app_config.dart';
import 'package:grocery_list/data/categories.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:grocery_list/widgets/grocer_item_tile.dart';
import 'package:grocery_list/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _fetchedItems;

  @override
  void initState() {
    super.initState();
    _fetchedItems = _fetchItems();
  }

  Future<List<GroceryItem>> _fetchItems() async {
    final url = AppConfig.getFirebaseUrl('groceries.json');
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        throw Exception('Failed to fetch grocery items.');
    }
    if (response.body == 'null') {
      return [];
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value['category'],
          )
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    return loadedItems;
     
  }

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    }
    // Refresh the future to refetch data from server
    setState(() {
      _fetchedItems = _fetchItems();
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    
    try {
      final url = AppConfig.getFirebaseUrl('groceries/${item.id}.json');
      final response = await http.delete(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Connection timeout');
        },
      );

      if (response.statusCode >= 400) {
        throw Exception('Server error: ${response.statusCode}');
      }
      
      // Success - item is already removed from UI
    } catch (error) {
      // Restore item to local list only - don't refresh Future to avoid error screen
      setState(() {
        _groceryItems.insert(index, item);
      });
      _showDeleteErrorSnackbar(item, error);
    }
  }

  String _getDeleteErrorMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();
    
    if (errorString.contains('timeout') || 
        errorString.contains('connection timeout')) {
      return '📶 No internet connection. Item restored to list.';
    }
    
    if (errorString.contains('socket') || 
        errorString.contains('network') ||
        errorString.contains('host lookup failed') ||
        errorString.contains('connection refused')) {
      return '🌐 Network error. Item restored to list.';
    }
    
    if (errorString.contains('server error') ||
        errorString.contains('400') ||
        errorString.contains('500')) {
      return '⚠️ Server error. Item restored to list.';
    }
    
    return '❌ Failed to delete item. Item restored to list.';
  }

  void _showDeleteErrorSnackbar(GroceryItem item, dynamic error) {
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _getDeleteErrorMessage(error),
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        action: SnackBarAction(
          label: 'Retry',
          textColor: Colors.white,
          onPressed: () => _removeItem(item),
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  // Extracted loading widget
  Widget _buildLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // Extracted error state widget
  Widget _buildErrorView(String error) {
    return  Center(
      child: Text(error),
    );
  }

  // Extracted empty state widget
  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "No items added yet.",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Start adding items to your grocery list by tapping the Add button above",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Extracted list view widget
  Widget _buildListView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.surface,
            Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          final item = _groceryItems[index];
          return Dismissible(
            key: ValueKey(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24),
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              child: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onErrorContainer,
                size: 28,
              ),
            ),
            onDismissed: (direction) {
              _removeItem(item);
            },
            child: GroceryItemTile(groceryItem: item),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            const Text('Grocery List'),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: FilledButton.tonalIcon(
              onPressed: _addItem,
              icon: const Icon(Icons.add, size: 20),
              label: const Text("Add"),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<GroceryItem>>(
        future: _fetchedItems, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingView();
          }
          if (snapshot.hasError) {
            return _buildErrorView(snapshot.error.toString());
          }
          if (snapshot.data!.isEmpty) {
            return _buildEmptyView();
          }
          _groceryItems = snapshot.data!; // Update local list for item operations
          return _buildListView();
        },
      ),
    );
  }
}
