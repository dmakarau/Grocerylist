import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_list/config/app_config.dart';
import 'package:grocery_list/data/categories.dart';
import 'package:grocery_list/models/category.dart';
import 'package:grocery_list/models/grocery_item.dart';
import 'package:http/http.dart' as http;

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = "";
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  String _getHumanReadableError(dynamic error) {
    final errorString = error.toString().toLowerCase();
    
    if (errorString.contains('timeout') || 
        errorString.contains('connection timeout')) {
      return '📶 No internet connection. Please check your network and try again.';
    }
    
    if (errorString.contains('socket') || 
        errorString.contains('network') ||
        errorString.contains('host lookup failed') ||
        errorString.contains('connection refused')) {
      return '🌐 Network error. Please check your internet connection.';
    }
    
    if (errorString.contains('failed to save') ||
        errorString.contains('400') ||
        errorString.contains('500')) {
      return '⚠️ Server error. Please try again in a moment.';
    }
    
    // Fallback for any other errors
    return '❌ Something went wrong. Please try again.';
  }

  void _showErrorSnackbar(String message) {
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
                message,
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
          onPressed: _saveItem,
        ),
        duration: const Duration(seconds: 6),
      ),
    );
  }

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });
      _formKey.currentState!.save();
      
      try {
        final url = AppConfig.getFirebaseUrl('groceries.json');
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory.title,
          }),
        ).timeout(
          const Duration(seconds: 10), // Add timeout
          onTimeout: () {
            throw Exception('Connection timeout. Please check your internet connection.');
          },
        );

        if (response.statusCode >= 400) {
          throw Exception('Failed to save item. Please try again.');
        }

        final responseData = json.decode(response.body);

        if (!mounted) return;
        
        Navigator.of(context).pop(
          GroceryItem(
            id: responseData['name'],
            name: _enteredName,
            quantity: _enteredQuantity,
            category: _selectedCategory,
          ),
        );
      } catch (error) {
        setState(() {
          _isSending = false;
        });
        
        if (!mounted) return;
        
        _showErrorSnackbar(_getHumanReadableError(error));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Item"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Modern header
              Text(
                "What do you need?",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Add a new item to your grocery list",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 32),

              // Modern name field
              TextFormField(
                key: const ValueKey("name_field"),
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "e.g., Bananas, Milk, Bread",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.shopping_cart_outlined),
                ),
                maxLength: 50,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "Must be between 2 and 50 characters long.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!.trim();
                },
              ),
              const SizedBox(height: 20),

              // Modern quantity and category row
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: ValueKey(_enteredQuantity),
                      decoration: InputDecoration(
                        labelText: "Quantity",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: const Icon(Icons.tag),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid positive number.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: FormField<Category>(
                      key: ValueKey(_selectedCategory),
                      initialValue: _selectedCategory,
                      builder: (FormFieldState<Category> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorText: state.errorText,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Category>(
                              value: state.value,
                              isExpanded: true,
                              items: [
                                for (final category in categories.entries)
                                  DropdownMenuItem<Category>(
                                    value: category.value,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: category.value.color,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Text(category.value.title),
                                      ],
                                    ),
                                  ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedCategory = value!;
                                });
                                state.didChange(value);
                              },
                            ),
                          ),
                        );
                      },
                      onSaved: (value) {
                        _selectedCategory =
                            value ?? categories[Categories.vegetables]!;
                      },
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Modern buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _isSending
                          ? null
                          : () {
                              setState(() {
                                _selectedCategory =
                                    categories[Categories.vegetables]!;
                                _enteredQuantity = 1;
                              });
                              _formKey.currentState!.reset();
                            },
                      icon: const Icon(Icons.refresh),
                      label: const Text("Reset"),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: FilledButton.icon(
                      onPressed: _isSending ? null : _saveItem,
                      icon: const Icon(Icons.add),
                      label: _isSending
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Add Item"),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
