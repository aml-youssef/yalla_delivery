import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class BaseUsecase <type, Paramter>{
  Future<Either<Failure, type>> call({required Paramter paramter});
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
