part of 'requist_cubit.dart';

abstract class RequistState extends Equatable {
  const RequistState();

  @override
  List<Object> get props => [];
}

class RequistInitialState extends RequistState {}

class RequistLoadingState extends RequistState {}

class RequistLoadedState extends RequistState {
  final Requist requist;

  const RequistLoadedState({required this.requist});
  @override
  List<Object> get props => [requist];
}

class RequistErrorState extends RequistState {
  final String errorMessege;

  const RequistErrorState({required this.errorMessege});

  @override
  List<Object> get props => [errorMessege];
}
