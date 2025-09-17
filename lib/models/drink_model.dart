import 'package:equatable/equatable.dart';

enum DrinkSize { small, medium, large }


class Drink extends Equatable {
  final String name;
  final double price;
  final List<String> ingredients;
  final DrinkSize size;

  const Drink({
    required this.name,
    required this.price,
    this.ingredients = const [],
    this.size = DrinkSize.medium,
  });

  @override
  List<Object?> get props => [name, price, ingredients, size, ];
}
