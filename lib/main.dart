import 'package:application_laboratorio/pages/my_home_page.dart';
import 'package:application_laboratorio/data/services/database_helper.dart';
import 'package:application_laboratorio/widgets/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Appdata())],
      child: const MyApp(),
    ),
  );
}
