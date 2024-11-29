// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String name;
  String email;

  UserModel({String name = '', String email = ''})
      : name = name,
        email = email;

  String get names => name;
  String get emails => email;

  void updateUser(String newName, String newEmail) {
    name = newName;
    email = newEmail;
    notifyListeners();
  }
}
