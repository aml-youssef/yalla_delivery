class ApiEndPoints {
  static const String baseUrl = 'https://resturant-appv1.herokuapp.com/';
  static String driverLogin = '${baseUrl}driver/login';
  static String singleDriver(String id) => '${baseUrl}driver/$id';
  static String driverImg = '${baseUrl}driver-img';
  static String changePassword = '${baseUrl}driver/change-password';
}

//https://www.postman.com/collections/c0eda11fd2929300916b