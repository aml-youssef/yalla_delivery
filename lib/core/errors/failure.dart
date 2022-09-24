import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String messege;

  const Failure({required this.messege});
  @override
  List<Object?> get props => [messege];
}

class ServerFailure extends Failure{
  const ServerFailure({required super.messege});  
}

class LocalFailure extends Failure{
  const LocalFailure({required super.messege});
}

class IntenetConnectionFailure extends Failure{
  const IntenetConnectionFailure({required super.messege});
}
