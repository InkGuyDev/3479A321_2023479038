import 'package:application_laboratorio/pages/about.dart';
import 'package:application_laboratorio/pages/list_content.dart';
import 'package:application_laboratorio/pages/my_home_page.dart';
//import 'package:application_laboratorio/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class Appdata extends ChangeNotifier {
  int _counter = 0;
  String _username = ' ';
  bool _resetAvaliable = true;
  int get counter => _counter;
  String get username => _username;
  bool get resetAvaliable => _resetAvaliable;

  TabBar tabBar() {
    return TabBar(
      tabs: const <Widget>[
        Tab(text: 'Home'),
        Tab(text: 'List Content'),
        Tab(text: 'About'),
      ],
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      children: const <Widget>[
        Center(child: MyHomePage(title: 'Home')),
        Center(child: ListContent()),
        Center(child: About()),
      ],
    );
  }

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
