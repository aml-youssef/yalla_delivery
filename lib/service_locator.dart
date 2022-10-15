import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yalla_delivery/core/network/dio_helper.dart';
import 'package:yalla_delivery/features/auth/domain/usecases/create_driver_requist_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/change_password_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/get_driver_data_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/update_driver_img_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/presentation/cubit/myprofile_cubit.dart';
import 'package:yalla_delivery/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'features/Balance/presentation/cubit/balance_cubit.dart';
import 'features/auth/data/datasources/auth_remote_datasource.dart';
import 'features/auth/data/repositories/driver_login_repository.dart';
import 'features/auth/domain/repositories/base_driver_login_repository.dart';
import 'features/auth/domain/usecases/get_driver_login_data_usecase.dart';
import 'features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'features/auth/presentation/cubit/requist_cubit/requist_cubit.dart';
import 'features/auth/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/my_Profile/data/datasources/my_profile_remote_data_source.dart';
import 'features/my_Profile/data/repositories/driver_repository.dart';
import 'features/my_Profile/domain/repositories/base_driver_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    //bloc
    sl.registerFactory(() => LoginCubit(getDriverLoginDataUsecase: sl()));

    sl.registerFactory(() => RequistCubit(createDriverRequistUsecase: sl()));

    sl.registerFactory(() => VerificationCubit());

    sl.registerFactory(() => NotificationsCubit());

    sl.registerFactory(() => BalanceCubit());

    sl.registerFactory(() => HomeCubit());

    sl.registerFactory(() => MyprofileCubit(
        getDriverDataUsecase: sl(),
        updateDriverImgUseCase: sl(),
        changePasswordUseCase: sl()));

    //usecase
    sl.registerLazySingleton(
        () => GetDriverLoginDataUsecase(baseDriverLoginRepository: sl()));

    sl.registerLazySingleton(
        () => CreateDriverRequistUsecase(baseDriverAuthRepository: sl()));

    sl.registerLazySingleton(
        () => UpdateDriverImgUseCase(baseDriverRepository: sl()));

    sl.registerLazySingleton(
        () => GetDriverDataUsecase(baseDriverRepository: sl()));

    sl.registerLazySingleton(
        () => ChangePasswordUseCase(baseDriverRepository: sl()));

    //repository
    sl.registerLazySingleton<BaseDriverAuthRepository>(
        () => DriverAuthRepository(baseRemoteDataSource: sl()));

    sl.registerLazySingleton<BaseDriverRepository>(
        () => DriverRepository(myProfileBaseRemoteDataSource: sl()));

    //data source
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource(dio: sl()));

    sl.registerLazySingleton<MyProfileBaseRemoteDataSource>(
        () => MyProfileRemoteDataSource(dio: sl()));

    //external
    sl.registerLazySingleton(() => DioHelper(dio: sl()));

    sl.registerLazySingleton(() => InternetConnectionChecker());

    sl.registerLazySingleton(() => LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ));

    sl.registerLazySingleton(() => Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,
            // baseUrl:
            connectTimeout: 20000,
            receiveTimeout: 20000,
          ),
        ));

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
