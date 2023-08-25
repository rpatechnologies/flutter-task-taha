import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:leaveapp/common/widgets/bottom_bar.dart';
import 'package:leaveapp/controllers/leave_balance_controller.dart';

import 'package:leaveapp/controllers/leave_details_controller.dart'; // Make sure you import the LeaveDetailsController
import 'package:leaveapp/services/push_notification.dart';
import 'package:leaveapp/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // DatabaseReference ref = FirebaseDatabase.instance.ref("/test");
  final CollectionReference postsRef = FirebaseFirestore.instance.collection('/test');
  final _firebaseMessaging = FirebaseMessaging.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      Map body = {
        'user_code': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        print(response.statusCode);

        final json = jsonDecode(response.body);
        if (json['status'] == 'success') {
          var token = json['token'];
          var userCode = emailController.text.trim();
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token);
          final leaveBalanceController = Get.find<LeaveBalanceController>();
          await leaveBalanceController.fetchLeaveBalance(userCode);

          String role = await PushNotifications.getRoleOfUser(userCode);
          if(role == "Admin"){
            print(role);
            try{
              await _firebaseMessaging.requestPermission();
              final fCMToken = await _firebaseMessaging.getToken();
              await postsRef.doc(userCode).set(
                  {
                    "role": "Manager",
                    "device_id": fCMToken,
                    "id": userCode,
                  }
              );
              print("Succsess");
            }catch(e){
              print("error");
            }
          }else{
            print(role);
            print("role is not admin");
          }

          final leaveDetailsController = Get.put(LeaveDetailsController());

          // Assuming you have already created an instance of LeaveDetailsController
          await leaveDetailsController.fetchLeaveDetails(
            userCode: userCode,
            filterMonth: '5', // You should provide the actual month here
            filterYear: '2023', // You should provide the actual year here
          );

          emailController.clear();
          passwordController.clear();
          Get.off(const BottomBar());
        } else {
          throw json['message'];
        }
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
