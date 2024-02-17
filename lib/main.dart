import 'package:flutter/material.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/screen/Add.dart';
import 'package:startify/views/screen/Help.dart';
import 'package:startify/views/screen/News.dart';
import 'package:startify/views/screen/Profile.dart';
import 'package:startify/views/screen/Home.dart';
import 'package:startify/views/screen/done.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/add',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/news': (context) => const NewsScreen(),
        '/add': (context) => const AddScreen(),
        '/help': (context) => const HelpScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/done': (context) => const Done(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.bleu, // Set the primary color
      ),
      home: const HomeScreen(),
    );
  }
}
