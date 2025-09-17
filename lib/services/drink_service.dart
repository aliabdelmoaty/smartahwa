import '../models/drink_model.dart';

/// Service class responsible for managing available drinks
/// Follows Single Responsibility Principle - only handles drink-related operations
abstract class DrinkService {
  List<Drink> getAvailableDrinks();
  Drink? getDrinkByName(String name);
}

class DrinkServiceImpl implements DrinkService {
  static final List<Drink> _availableDrinks = [
    const Drink(
      name: 'Shai (Tea)',
      price: 5.0,
      ingredients: ['Black Tea', 'Sugar', 'Mint'],
      size: DrinkSize.medium,
    ),
    const Drink(
      name: 'Turkish Coffee',
      price: 12.0,
      ingredients: ['Coffee Beans', 'Sugar'],
      size: DrinkSize.small,
    ),
    const Drink(
      name: 'Hibiscus Tea',
      price: 8.0,
      ingredients: ['Hibiscus', 'Sugar', 'Lemon'],
      size: DrinkSize.medium,
    ),
    const Drink(
      name: 'Arabic Coffee',
      price: 15.0,
      ingredients: ['Arabic Coffee Beans', 'Cardamom'],
      size: DrinkSize.small,
    ),
    const Drink(
      name: 'Nescafe',
      price: 6.0,
      ingredients: ['Instant Coffee', 'Sugar', 'Milk'],
      size: DrinkSize.medium,
    ),
    const Drink(
      name: 'Fresh Juice',
      price: 10.0,
      ingredients: ['Fresh Fruit'],
      size: DrinkSize.large,
    ),
  ];

  @override
  List<Drink> getAvailableDrinks() {
    return List.unmodifiable(_availableDrinks);
  }

  @override
  Drink? getDrinkByName(String name) {
    try {
      return _availableDrinks.firstWhere((drink) => drink.name == name);
    } catch (e) {
      return null;
    }
  }
}
