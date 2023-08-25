import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leaveapp/controllers/login_controller.dart';
import 'package:leaveapp/controllers/leave_balance_controller.dart'; // Import your LeaveBalanceController
import 'package:leaveapp/screens/auth/auth_screen.dart';
import 'package:leaveapp/services/push_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  await initServices(); // Initialize any services if required
  runApp(const MyApp());
}

Future<void> initServices() async {
  // Initialize any services here if needed
  Get.put(LoginController());
  Get.put(
      LeaveBalanceController()); // Initialize and register the LeaveBalanceController
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
