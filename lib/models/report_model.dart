import 'package:equatable/equatable.dart';
import 'drink_model.dart';

class Report extends Equatable {
  final DateTime createdAt;
  final int totalOrders;
  final int pendingOrders;
  final int completedOrders;
  final double revenue;
  final Map<Drink, int> topSellingDrinks;

  const Report({
    required this.createdAt,
    this.totalOrders = 0,
    this.pendingOrders = 0,
    this.completedOrders = 0,
    this.revenue = 0,
    this.topSellingDrinks = const {},
  });

  @override
  List<Object?> get props => [
    createdAt,
    totalOrders,
    pendingOrders,
    completedOrders,
    revenue,
    topSellingDrinks,
  ];
}
