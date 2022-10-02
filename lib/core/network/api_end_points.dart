class ApiEndPoints {
  static const String baseUrl = 'https://resturant-appv1.herokuapp.com/';
  static const String driverLogin = '${baseUrl}driver/login';
  static String singleDriver(String id) => '${baseUrl}driver/$id';
  static const String driverImg = '${baseUrl}driver-img';
  static const String changePassword = '${baseUrl}driver/change-password';
  static const String createRequist = '${baseUrl}request';
}

//https://www.postman.com/collections/c0eda11fd2929300916b
