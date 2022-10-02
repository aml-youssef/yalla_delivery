part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  final DriverLogin driverLogin;

  const LoginLoadedState({required this.driverLogin});

  @override
  List<Object?> get props => [driverLogin];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String errorMessege;

  const LoginErrorState({required this.errorMessege});

  @override
  List<Object?> get props => [errorMessege];
}
