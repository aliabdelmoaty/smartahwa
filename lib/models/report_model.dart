import 'package:equatable/equatable.dart';
import 'drink_model.dart';

class Report extends Equatable {
  final int totalOrders;
  final int pendingOrders;
  final int completedOrders;
  final Map<Drink, int> topSellingDrinks;

  const Report({
    this.totalOrders = 0,
    this.pendingOrders = 0,
    this.completedOrders = 0,
    this.topSellingDrinks = const {},
  });

  @override
  List<Object?> get props => [
    totalOrders,
    pendingOrders,
    completedOrders,
    topSellingDrinks,
  ];
}
