import 'dart:convert';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:leaveapp/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> _getBearerToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}
class PushNotifications{
  static Future<String> getRoleOfUser(String key) async {
    try{

      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.getEmployeeRole);
      final String bearerToken = await _getBearerToken();

      final Map<String, String> headers = {
        'Authorization': 'Bearer $bearerToken',
        'Content-Type': 'application/json',
      };

      final Map<String, dynamic> requestBody = {
        'user_code': key,
      };
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(requestBody),
      );
      print('Employee Role: ${response.statusCode}');
      print('Employee Role: ${response.body}');
    //  final json = jsonDecode(response.body);
      var data = jsonDecode(response.body)['data'];
      // print("Datae is ${data['role']}");
      return data['role'];
    }catch(e){
      print(e);
      return "Employee";
    }
  }
  static Future<void> sendPushNotification(String userToken, String title, String message) async {
    try{
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      final body = {
        "to": userToken,
        "notification": {"title": title, "body": message},
      };
      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader:
          "key=AAAA27lPXMg:APA91bF_zSSSeXzytK4TlgwT-ivBY5Lll0pj0Md_B0lxemcmRP5Qkdfw6BHBatO1JaSHFecPKJy8nnOMJr6ZsYQTAw5Acpcu7CXbmN8yk5wfNmx0ga2uqjLGusfY_D4hC-DHgw6mln4c",
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }catch(e){
      print(e);
    }
  }
}

Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  print(message?.notification?.title);
  print(message?.notification?.body);
  print(message?.data);
}
final _localNotifications = FlutterLocalNotificationsPlugin();
final _androidChannel = const AndroidNotificationChannel(
  "high_importance_channel",
  "High_Importance_Notifications",
  description: "This channel's if used for important notifications",
  importance: Importance.defaultImportance,
);

Future initLocalNotifications() async {
  const iOS = DarwinInitializationSettings();
  const android = AndroidInitializationSettings("@drawable/ic_launcher");
  const settings = InitializationSettings(android: android, iOS: iOS);
  await _localNotifications.initialize(
    settings,
    // onDidReceiveNotificationResponse: handleBackgroundMessage,
    // onDidReceiveBackgroundNotificationResponse: handleBackgroundMessage,
    // onDidReceiveNotificationResponse: (payload) => handleBackgroundMessage,
    // onDidReceiveBackgroundNotificationResponse: (payload) => handleBackgroundMessage,
  );
  final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  await platform?.createNotificationChannel(_androidChannel);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("token: $fCMToken");
    initPushNotifications();
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initLocalNotifications();
  }

  // void handleMessage(RemoteMessage? message){
  //   if(message == null) return;
  //   //DO Something on click
  // }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print(event);
    });
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: "@drawable/ic_launcher",
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }
}
