part of 'myprofile_cubit.dart';

abstract class MyprofileState extends Equatable {
  const MyprofileState();
}

class MyprofileInitialState extends MyprofileState {
  @override
  List<Object?> get props => [];
}

class MyprofileLoadingState extends MyprofileState {
  @override
  List<Object?> get props => [];
}

class MyprofileLoadedState extends MyprofileState {
  final Driver driver;

  const MyprofileLoadedState({required this.driver});

  @override
  List<Object?> get props => [driver];
}

class MyprofileErrorState extends MyprofileState {
  final String errorMessege;

  const MyprofileErrorState({required this.errorMessege});

  @override
  List<Object?> get props => [errorMessege];
}
