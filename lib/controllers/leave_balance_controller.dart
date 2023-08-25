import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:leaveapp/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaveBalanceController extends GetxController {
  RxMap<String, dynamic> leaveBalance = <String, dynamic>{}.obs;

  Future<String> _getBearerToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  //  @override
  // void onInit() {
  //   super.onInit();
  //   fetchLeaveBalance(userCode);
  // }

  Future<void> fetchLeaveBalance(String userCode) async {
    var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.employeeLeaveBalance);
    final String bearerToken = await _getBearerToken();

    final Map<String, String> headers = {
      'Authorization': 'Bearer $bearerToken',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      'user_code': userCode,
    };

    try {
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        leaveBalance.value = jsonDecode(response.body)['data'];
      } else {
        throw Exception('Failed to fetch leave balance');
      }
    } catch (e) {
      throw Exception('Failed to fetch leave balance: $e');
    }
  }
}
