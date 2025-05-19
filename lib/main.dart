import 'package:application_laboratorio/pages/my_home_page.dart';
import 'package:application_laboratorio/Provider/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Appdata())],
      child: const MyApp(),
    ),
  );
}
