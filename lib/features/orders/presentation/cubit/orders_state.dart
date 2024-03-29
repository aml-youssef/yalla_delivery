part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitialState extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {}

class OrdersErrorState extends OrdersState {
  final String errorMessege;

  const OrdersErrorState({required this.errorMessege});

  @override
  List<Object> get props => [errorMessege];
}
