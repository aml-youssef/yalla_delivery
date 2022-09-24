part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadedState extends AuthState {
  final DriverLogin driverLogin;

  const AuthLoadedState({required this.driverLogin});

  @override
  List<Object?> get props => [driverLogin];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String errorMessege;

  const AuthErrorState({required this.errorMessege});

  @override
  List<Object?> get props => [errorMessege];
}
