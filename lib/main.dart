import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:leaveapp/screens/auth/auth_screen.dart';
import 'package:leaveapp/screens/leaveRequest/leave_request.dart';

main() async {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthScreen(),
  ));
}
