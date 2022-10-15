part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeChangrNavigatoinBottomState extends HomeState {}

// class HomeLoadedState extends HomeState {}

// class HomeErrorState extends HomeState {
//   final String errormsg;

//   const HomeErrorState({required this.errormsg});

//   @override
//   List<Object> get props => [errormsg];
// }
