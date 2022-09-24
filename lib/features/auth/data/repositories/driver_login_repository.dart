import 'package:yalla_delivery/core/errors/exceptions.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/base_driver_login_repository.dart';
import '../datasources/remote_datasource.dart';

class DriverLoginRepository implements BaseDriverLoginRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  DriverLoginRepository({required this.baseRemoteDataSource});
  @override
  Future<Either<Failure, DriverLogin>> getDriverLoginData({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await baseRemoteDataSource.getDriverLoginData(
        userName: userName,
        password: password,
      );
      return Right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege:  error.errorMessegeModel.toString()));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }
}
