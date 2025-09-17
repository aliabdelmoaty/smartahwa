import 'package:equatable/equatable.dart';

import 'drink_model.dart';

enum OrderStatus { pending, completed, canceled }

class OrderModel extends Equatable {
  final String customerName;
  final DateTime date;
  final Drink drink;
  final String specialInstructions;
  final OrderStatus status;

  const OrderModel({
    required this.customerName,
    required this.date,
    required this.drink,
    required this.specialInstructions,
    required this.status,
  });

  @override
  List<Object?> get props => [
    customerName,
    date,
    drink,
    specialInstructions,
    status,
  ];
}
