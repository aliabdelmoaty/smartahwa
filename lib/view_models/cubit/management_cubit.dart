import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartahwa/models/order_model.dart';

import '../../models/report_model.dart';
import '../../services/order_repository.dart';
import '../../services/report_service.dart';

part 'management_state.dart';

class ManagementCubit extends Cubit<ManagementState> {
  final OrderRepository _orderRepository;
  final ReportService _reportService;

  ManagementCubit({
    OrderRepository? orderRepository,
    ReportService? reportService,
  }) : _orderRepository = orderRepository ?? OrderRepositoryImpl(),
       _reportService = reportService ?? ReportServiceImpl(),
       super(ManagementInitial());

  List<OrderModel> get order => _orderRepository.getAllOrders();
  Report? _report;
  Report? get report => _report;

  void setOrder(OrderModel order) {
    _orderRepository.addOrder(order);
    _report = _reportService.generateReport(_orderRepository.getAllOrders());
    emit(OrdersState(_orderRepository.getAllOrders()));
  }

  void completeOrder(OrderModel order) {
    final updatedOrder = order.copyWith(status: OrderStatus.completed);
    _orderRepository.updateOrder(updatedOrder);
    _report = _reportService.generateReport(_orderRepository.getAllOrders());
    emit(OrdersState(_orderRepository.getAllOrders()));
  }

  Report getReport() {
    return _reportService.generateReport(_orderRepository.getAllOrders());
  }
}
