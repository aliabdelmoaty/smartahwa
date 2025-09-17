import 'package:flutter/material.dart';

import '../../models/drink_model.dart';
import '../../services/drink_service.dart';

class DrinkSelection extends StatelessWidget {
  final Drink? selectedDrink;
  final Function(Drink?) onDrinkChanged;

  const DrinkSelection({
    super.key,
    required this.selectedDrink,
    required this.onDrinkChanged,
  });

  @override
  Widget build(BuildContext context) {
    final DrinkServiceImpl drinkService = DrinkServiceImpl();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Drink>(
          hint: const Text('Select a drink'),
          value: selectedDrink,
          isExpanded: true,
          items: drinkService.getAvailableDrinks().map((Drink drink) {
            return DropdownMenuItem<Drink>(
              value: drink,
              child: Row(
                children: [
                  Icon(Icons.local_cafe_outlined, color: Colors.brown),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          drink.name,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${drink.price.toStringAsFixed(0)} EGP',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onDrinkChanged,
        ),
      ),
    );
  }
}
