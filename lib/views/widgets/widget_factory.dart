import 'package:flutter/material.dart';

import '../../models/drink_model.dart';

/// Abstract base class for drink widgets demonstrating Polymorphism
/// Follows Open/Closed Principle - open for extension, closed for modification
abstract class DrinkWidget {
  Widget build(BuildContext context, Drink drink);
}

/// Concrete implementations for different drink categories
class CoffeeWidget extends DrinkWidget {
  @override
  Widget build(BuildContext context, Drink drink) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_cafe, color: Colors.brown.shade700, size: 16),
          const SizedBox(width: 4),
          Text(
            drink.name,
            style: TextStyle(
              color: Colors.brown.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class TeaWidget extends DrinkWidget {
  @override
  Widget build(BuildContext context, Drink drink) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.emoji_food_beverage,
            color: Colors.green.shade700,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            drink.name,
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ColdDrinkWidget extends DrinkWidget {
  @override
  Widget build(BuildContext context, Drink drink) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_cafe_outlined,
            color: Colors.blue.shade700,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            drink.name,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
