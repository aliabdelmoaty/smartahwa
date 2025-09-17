import '../models/order_model.dart';
import '../models/report_model.dart';
import '../models/drink_model.dart';

/// Service class responsible for generating reports
/// Follows Single Responsibility Principle - only handles report generation logic
abstract class ReportService {
  Report generateReport(List<OrderModel> orders);
  Map<Drink, int> calculateTopSellingDrinks(List<OrderModel> orders);
}

class ReportServiceImpl implements ReportService {
  @override
  Report generateReport(List<OrderModel> orders) {
    final topSellingDrinks = calculateTopSellingDrinks(orders);

    return Report(
      totalOrders: orders.length,
      pendingOrders: orders
          .where((o) => o.status == OrderStatus.pending)
          .length,
      completedOrders: orders
          .where((o) => o.status == OrderStatus.completed)
          .length,
      topSellingDrinks: topSellingDrinks,
    );
  }

  @override
  Map<Drink, int> calculateTopSellingDrinks(List<OrderModel> orders) {
    final Map<Drink, int> drinkCounts = {};

    for (final order in orders) {
      drinkCounts[order.drink] = (drinkCounts[order.drink] ?? 0) + 1;
    }

    return drinkCounts;
  }
}
