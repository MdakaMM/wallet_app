import 'package:flutter/material.dart';
import 'package:wallet_app/pages/card/card_detail.dart';
import 'package:wallet_app/pages/inbox/inbox_page.dart';
import 'package:wallet_app/pages/profile/profile_page.dart';
import 'package:wallet_app/splash_view.dart';

import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashView(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/card': (context) => const CardDetail(),
        '/inbox': (context) => const InboxPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
