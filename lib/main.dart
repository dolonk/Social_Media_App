import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/responsive/mobileScreenLayout.dart';
import 'package:instagram/responsive/responsive_layout.dart';
import 'package:instagram/responsive/webScreenLayout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/singUp_screen.dart';
import 'package:instagram/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDhRs61PHs0YIGYeTO95PpJzOnOyvEbrQI",
            appId: "1:227534600429:web:565833cd2fb1018fe8b4e4",
            messagingSenderId: "227534600429",
            projectId: "instagram-96d37",
            storageBucket: "instagram-96d37.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      /*home: const ResponsiveLayout(
          webScreenLayout: WebScreenLayout(),
          mobileScreenLayout: MobileScreenLayout()),*/
      home: SingUpScreen(),
    );
  }
}
