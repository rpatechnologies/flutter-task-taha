import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:leaveapp/models/leave_details_data.dart';
import 'package:leaveapp/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveDetailsController extends GetxController {
  Rx<LeaveDetailsData?> leaveDetails = Rx<LeaveDetailsData?>(null);

  Future<String> _getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<void> fetchLeaveDetails({
    required String userCode,
    required String filterMonth,
    required String filterYear,
  }) async {
    var url = Uri.parse(ApiEndPoints.baseUrl +
        ApiEndPoints.authEndpoints.getEmployeeLeaveDetails);

    final String bearerToken = await _getBearerToken();

    final Map<String, String> headers = {
      'Authorization': 'Bearer $bearerToken',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      'user_code': userCode,
      'filter_month': filterMonth,
      'filter_year': filterYear,
      'filter_leave_status': ['Approved'],
    };

    try {
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        leaveDetails.value = LeaveDetailsData.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch leave details');
      }
    } catch (e) {
      throw Exception('Failed to fetch leave details: $e');
    }
  }
}
