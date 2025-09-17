import '../models/order_model.dart';

/// Repository interface for order data management
/// Follows Interface Segregation Principle - defines only necessary methods
/// Follows Dependency Inversion Principle - depends on abstraction, not concrete implementation
abstract class OrderRepository {
  List<OrderModel> getAllOrders();
  void addOrder(OrderModel order);
  void updateOrder(OrderModel order);
  OrderModel? getOrderById(String id);
}

/// In-memory implementation of order repository
/// Follows Single Responsibility Principle - only handles order data storage
class OrderRepositoryImpl implements OrderRepository {
  final List<OrderModel> _orders = [];

  @override
  List<OrderModel> getAllOrders() {
    return List.unmodifiable(_orders);
  }

  @override
  void addOrder(OrderModel order) {
    _orders.add(order);
  }

  @override
  void updateOrder(OrderModel order) {
    final index = _orders.indexWhere((o) => o.id == order.id);
    if (index != -1) {
      _orders[index] = order;
    }
  }

  @override
  OrderModel? getOrderById(String id) {
    try {
      return _orders.firstWhere((order) => order.id == id);
    } catch (e) {
      return null;
    }
  }
}
