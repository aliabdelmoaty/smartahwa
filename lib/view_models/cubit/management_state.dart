part of 'management_cubit.dart';

sealed class ManagementState extends Equatable {
  const ManagementState();

  @override
  List<Object> get props => [];
}

final class ManagementInitial extends ManagementState {}

final class OrdersState extends ManagementState {
  final List<OrderModel> orders;
  const OrdersState(this.orders);

  @override
  List<Object> get props => [orders];
}

final class ReportState extends ManagementState {
  final Report report;
  const ReportState(this.report);

  @override
  List<Object> get props => [report];
}
