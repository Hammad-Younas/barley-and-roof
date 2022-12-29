import 'dart:convert';

import 'package:barley_and_roof/Services/GetFirebaseImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('logo');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    notificationsPlugin = FlutterLocalNotificationsPlugin();
    notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  // makePayment() async {
  //   try {
  //     var paymentIntentData = await createPaymentIntent("20", "USD");
  //     await Stripe.instance.initPaymentSheet(
  //       paymentSheetParameters: SetupPaymentSheetParameters(
  //         paymentIntentClientSecret: paymentIntentData['client-secret'],
  //       ),
  //     );
  //     await displayPayment();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // displayPayment() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "amount": amount,
        "currency": currency,
        "payment_method_types[]": "card",
      };
      var response = await post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        body: body,
        headers: {
          "Authorization":
              "Bearer sk_test_51MAmwWG1foiCaFHHE5p7GbEWrh3EzOFIxQ4qmq6r8viaNEREFJ6frUfF98iqnf0Y3sb6shDi0i7sOm7WTNWaAC4I00o0klRJH3",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      return jsonDecode(response.body.toString());
    } catch (e) {
      print(e);
    }
  }

  GetImagesServices imagesServices = GetImagesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showNotificationWithDefaultSound();
              },
              child: const Text("Notification"),
            ),
            ElevatedButton(
              onPressed: () async {
                await imagesServices.uploadImagesinFirestore();
              },
              child: const Text("upload image"),
            ),
            ElevatedButton(
              onPressed: () async {
                await imagesServices.getUsersData();
                print(imagesServices.list[0].email);
              },
              child: const Text("Get UsersData"),
            ),
            ElevatedButton(
              onPressed: () async {
                await imagesServices
                    .uploadAllRoomstoUser("shahzad90@gmail.com");
              },
              child: const Text("Upload image to user"),
            ),
            ElevatedButton(
              onPressed: () async {
                await imagesServices.bookRoom("room1", "shahzad90@gmail.com");
                print(imagesServices.dataModel.imageurl);
              },
              child: const Text("Book Room"),
            ),
          ],
        ),
      ),
    );
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await notificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  onSelectNotification(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
          builder: (context) => SecondScreen(
                payload: payload,
              )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String? payload;
  const SecondScreen({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          payload.toString(),
        ),
      ),
    );
  }
}
