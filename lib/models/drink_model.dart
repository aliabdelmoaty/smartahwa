import 'package:equatable/equatable.dart';

enum DrinkSize { small, medium, large }

enum DrinkCategory { hot, cold, tea, coffee }

class Drink extends Equatable {
  final String name;
  final double price;
  final List<String> ingredients;
  final DrinkSize size;
  final DrinkCategory category;

  const Drink({
    required this.name,
    required this.price,
    this.ingredients = const [],
    this.size = DrinkSize.medium,
    this.category = DrinkCategory.hot,
  });

  @override
  List<Object?> get props => [name, price, ingredients, size, category];
}
