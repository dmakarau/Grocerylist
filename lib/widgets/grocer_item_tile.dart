import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_item.dart';

class GroceryItemTile extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryItemTile({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Category indicator with modern styling
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: groceryItem.category.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: groceryItem.category.color.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  _getCategoryIcon(groceryItem.category.title),
                  color: groceryItem.category.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              // Item details with improved typography
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      groceryItem.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      groceryItem.category.title,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              // Quantity badge with modern styling
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${groceryItem.quantity}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryTitle) {
    switch (categoryTitle.toLowerCase()) {
      case 'vegetables':
        return Icons.local_florist;
      case 'fruit':
        return Icons.apple;
      case 'meat':
        return Icons.set_meal;
      case 'dairy':
        return Icons.local_drink;
      case 'carbs':
        return Icons.bakery_dining;
      case 'sweets':
        return Icons.cake;
      case 'spices':
        return Icons.grass;
      case 'convenience':
        return Icons.shopping_bag;
      case 'hygiene':
        return Icons.clean_hands;
      default:
        return Icons.shopping_cart;
    }
  }
}
