import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:portfolio/Pages/mobile_devices_pages/Mob_HomePage.dart';
import 'package:portfolio/providers/Navprovider.dart';

import 'Pages/Hire_me_Page.dart';
import 'Pages/HomePage.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform,);
  Get.put(NavController());
  runApp(GetMaterialApp(
      routes: {
        //'/contact': (context) => ContactFormPage(),
        // Other routes
      },
      debugShowCheckedModeBanner: false,
      home:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    print('main screen ${screenSize.height}');
    return MaterialApp(
      title: 'Aayush Arora',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarte
      ),
      debugShowCheckedModeBanner: false,
      home: screenSize.width>1225? HomePage():MobHomePage(),
    );
  }
}

