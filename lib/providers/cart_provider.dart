import 'package:brand_store_app/models/shirt_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem {
  final ShirtModel shirt;
  int quantity;

  CartItem({required this.shirt, this.quantity = 1});
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  /// Add an item to the cart
  void addItem(ShirtModel shirt) {
    final existingItem = state.firstWhere(
      (item) => item.shirt.name == shirt.name,
      orElse: () => CartItem(shirt: shirt, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      // Update quantity if item exists
      existingItem.quantity += 1;
      state = [...state]; // Trigger state update
    } else {
      // Add new item if it doesn't exist
      state = [...state, CartItem(shirt: shirt)];
    }
  }

  /// Remove an item from the cart
  void removeItem(ShirtModel shirt) {
    state = state.where((item) => item.shirt.name != shirt.name).toList();
  }

  /// Decrement the quantity of an item, or remove if quantity reaches zero
  void decrementItem(ShirtModel shirt) {
    final existingItem = state.firstWhere(
      (item) => item.shirt.name == shirt.name,
      orElse: () => CartItem(shirt: shirt, quantity: 0),
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity -= 1;
      state = [...state]; // Trigger state update
    } else {
      removeItem(shirt);
    }
  }

  /// Get the total cost of items in the cart
  double get totalCost {
    return state.fold(
      0.0,
      (sum, item) => sum + (item.shirt.price * item.quantity),
    );
  }

  /// Get the total quantity of items in the cart
  int get totalQuantity {
    return state.fold(0, (sum, item) => sum + item.quantity);
  }

  /// Get the total quantity of a specific item
  int getItemQuantity(ShirtModel shirt) {
    final existingItem = state.firstWhere(
      (item) => item.shirt.name == shirt.name,
      orElse: () => CartItem(shirt: shirt, quantity: 0),
    );
    return existingItem.quantity;
  }

  /// Clear all items in the cart
  void clearCart() {
    state = [];
  }
}

/// Provider for CartNotifier
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
