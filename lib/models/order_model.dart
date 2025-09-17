import 'package:equatable/equatable.dart';

import 'drink_model.dart';

enum OrderStatus { pending, completed }

class OrderModel extends Equatable {
  final String id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  final OrderStatus status;

  const OrderModel({
    required this.id,
    required this.customerName,
    required this.drink,
    required this.specialInstructions,
    required this.status,
  });
  OrderModel copyWith({
    String? id,
    String? customerName,
    DateTime? date,
    Drink? drink,
    String? specialInstructions,
    OrderStatus? status,
  }) => OrderModel(
    id: id ?? this.id,
    customerName: customerName ?? this.customerName,
    drink: drink ?? this.drink,
    specialInstructions: specialInstructions ?? this.specialInstructions,
    status: status ?? this.status,
  );
  @override
  List<Object?> get props => [
    id,
    customerName,
    drink,
    specialInstructions,
    status,
  ];
}
