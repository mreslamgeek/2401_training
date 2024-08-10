part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoaded extends OrderState {}

final class NewOrderCreated extends OrderState {
  final Order order;

  NewOrderCreated({required this.order});
}
