import 'package:flutter/material.dart';

class Appdata extends ChangeNotifier {
  int _counter = 0;
  String _username = ' ';
  bool _resetAvaliable = true;
  int get counter => _counter;
  String get username => _username;
  bool get resetAvaliable => _resetAvaliable;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decreaseCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void toggleResetWidget() {
    _resetAvaliable = !_resetAvaliable;
    notifyListeners();
  }

  void setUserName(String newname) {
    _username = newname;
    notifyListeners();
  }
}
