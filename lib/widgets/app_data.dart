import 'package:application_laboratorio/pages/gallery_screen.dart';
import 'package:application_laboratorio/pages/my_home_page.dart';
//import 'package:application_laboratorio/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class Appdata extends ChangeNotifier {
  int _counter = 0;
  String _username = ' ';
  bool _resetAvaliable = true;
  List<String?> _imagePaths = [];
  int get counter => _counter;
  String get username => _username;
  bool get resetAvaliable => _resetAvaliable;
  List<String?> get imagePaths => _imagePaths;

  TabBar tabBar() {
    return TabBar(
      tabs: const <Widget>[Tab(text: 'Home'), Tab(text: 'Gallery')],
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      children: <Widget>[
        const Center(child: MyHomePage(title: 'Home')),
        Center(child: GalleryScreen(imagePathsOnGallery: _imagePaths)),
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

  void setResetWidget(bool newBool) {
    _resetAvaliable = newBool;
    notifyListeners();
  }

  void setUserName(String newname) {
    _username = newname;
    notifyListeners();
  }
}
