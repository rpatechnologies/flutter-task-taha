class ApiEndPoints {
  static final String baseUrl = 'https://demoliveone.abshrms.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'auth/login';
  final String employeeLeaveBalance = 'attendance/getEmployeeLeaveBalance';
}
