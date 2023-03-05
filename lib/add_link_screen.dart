import 'package:appgain_flutter_task/all_links_screen.dart';
import 'package:appgain_flutter_task/api.dart';
import 'package:appgain_flutter_task/my_button_widget.dart';
import 'package:appgain_flutter_task/my_text_widget.dart';
import 'package:appgain_flutter_task/text_field_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';

class AddLinkScreen extends StatefulWidget {
  const AddLinkScreen({super.key});

  @override
  State<AddLinkScreen> createState() => _AddLinkScreenState();
}

class _AddLinkScreenState extends State<AddLinkScreen> {
  TextEditingController webUrlController = TextEditingController();
  TextEditingController iosPrimaryController = TextEditingController();
  TextEditingController iosFallbackController = TextEditingController();
  TextEditingController androidPrimaryController = TextEditingController();
  TextEditingController androidFallbackController = TextEditingController();
  String deviceToken = "";
  var data;
  final _formKey = GlobalKey<FormState>();

  fieldValidation(value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    NotificationSettingsIos iosSettings = const NotificationSettingsIos();
    Future<PermissionStatus> permissionStatus =
        NotificationPermissions.requestNotificationPermissions();

    FirebaseMessaging firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    firebaseMessaging.getToken().then((token) {
      setState(() {
        deviceToken = token!;
      });
      print("token is $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Notification Title: ${message.notification?.title}');
        print('Notification Body: ${message.notification?.body}');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("appgain task"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  SelectableText('Device token : $deviceToken'),
                  const SizedBox(height: 15),
                  MyTextField(
                    text: "web Url",
                    controller: webUrlController,
                    validator: (value) => fieldValidation(value),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    text: "Ios Primary Url",
                    controller: iosPrimaryController,
                    validator: (value) => fieldValidation(value),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    text: "Ios Fallback Url",
                    controller: iosFallbackController,
                    validator: (value) => fieldValidation(value),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    text: "Android Primary Url",
                    controller: androidPrimaryController,
                    validator: (value) => fieldValidation(value),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    text: "Android Fallback Url",
                    controller: androidFallbackController,
                    validator: (value) => fieldValidation(value),
                  ),
                  const SizedBox(height: 15),
                  MyBottonWidget(
                    onTap: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   print("Successful");
                      //   data = {
                      //     "ios": {
                      //       "primary": iosPrimaryController.text,
                      //       "fallback": iosFallbackController.text
                      //     },
                      //     "android": {
                      //       "primary": androidPrimaryController.text,
                      //       "fallback": androidFallbackController.text
                      //     },
                      //     "web": webUrlController.text
                      //   };
                      //   var status = await ApiServices().addLinkRequest(data);
                      //   if (status == 201) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //         content: Text("data added to database"),
                      //       ),
                      //     );
                      //   }
                      // } else {
                      //   print("unsuccessful");
                      // }
                    },
                    text: "Submit Link",
                  ),
                  const SizedBox(height: 25),
                  MyBottonWidget(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const AllLinksScreen(),
                      //   ),
                      // );
                    },
                    text: "Go To All Links",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
