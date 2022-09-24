import 'error_messege_model.dart';

class ServerExeption implements Exception {
  final ErrorMessegeModel errorMessegeModel;

  ServerExeption({required this.errorMessegeModel});
}

class IntenetConnectionException implements Exception {
  final String errorMessege;

  IntenetConnectionException({required this.errorMessege});
}

class PermissionsExeptions implements Exception {
  final String errorMessege;

  PermissionsExeptions({required this.errorMessege});
}

class CacheExeptions implements Exception {
  final String errorMessege;

  CacheExeptions({required this.errorMessege});
}
