import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _firstName = "Sean";
  String _lastName = "Paul";
  String _hobby = "Listening to music";

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get hobby => _hobby;

  void changeProfile(String firstName, String lastName, String hobby) {
    _firstName = firstName;
    _lastName = lastName;
    _hobby = hobby;
    notifyListeners();
  }
}