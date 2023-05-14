import 'package:flutter/material.dart';
import 'Login.dart';
import 'MyNavigationBar.dart';
import 'MyProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Vendors',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        
        '/': (context) => LoginPage(),
        '/profile':(context) => MyProfile(),
        '/home': (context) => MyNavigationBar(),
      },
    );
  }
}
