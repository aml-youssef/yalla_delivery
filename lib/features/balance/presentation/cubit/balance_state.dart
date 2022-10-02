part of 'balance_cubit.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

class BalanceInitialState extends BalanceState {}

class BalanceLoadingState extends BalanceState {}

class BalanceLoadedState extends BalanceState {}

class BalanceErrorState extends BalanceState {
    final String errorMessege;

  const BalanceErrorState({required this.errorMessege});

  @override
  List<Object> get props => [errorMessege];
}
