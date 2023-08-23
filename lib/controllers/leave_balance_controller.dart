import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leaveapp/utils/api_endpoints.dart';

class LeaveBalanceController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  RxMap<String, double> leaveBalances = RxMap<String, double>();

  @override
  void onInit() {
    super.onInit();
    fetchLeaveBalance();
  }

  Future<void> fetchLeaveBalance() async {
    final SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var url = Uri.parse(
          'https://demoliveone.abshrms.com/api/attendance/getEmployeeLeaveBalance');
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json); // Debug: Print the API response
        if (json['status'] == 'success') {
          final data = json['data'] as Map<String, dynamic>;
          leaveBalances.assignAll(Map.from(data)
              .map((key, value) => MapEntry(key, value.toDouble())));
          print(leaveBalances); // Debug: Print the leaveBalances map
        }
      }
    } catch (error) {
      print(error.toString()); // Print any errors for debugging
    }
  }
}
