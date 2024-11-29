// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'user_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UserModel(name: 'KEERTHANA', email: 'keerthana.stackup@gmail.com'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    );
  }
}
