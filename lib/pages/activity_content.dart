import 'package:flutter/material.dart';
import 'package:application_laboratorio/data/services/database_helper.dart';
import 'package:application_laboratorio/domain/entities/activity.dart';
import 'package:application_laboratorio/widgets/app_data.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

import 'dart:async';

final DatabaseHelper _dbHelper = DatabaseHelper();
List<Activity> _activities = [];

Logger log = Logger();

Activity act = Activity(id: 1, fecha: '12/05/2005', nombre: 'Rodrigo');

class ActivityContent extends StatefulWidget {
  const ActivityContent({super.key});

  @override
  State<ActivityContent> createState() => _ActivityContentState();
}

class _ActivityContentState extends State<ActivityContent> {
  Future<void> loadActivities() async {
    _activities = await _dbHelper.recoverActivities();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    //_dbHelper.recoverActivities();
    loadActivities();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 43, 0, 255),
          title: Text('Lista de Actividades'),
        ),
        body: ListView.builder(
          itemCount: _activities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                _activities[index].toString(),
                style: TextStyle(
                  color: const Color.fromRGBO(0, 4, 255, 1),
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () async {
              _dbHelper.insertActivity(act);
              loadActivities();
              //_activities = await _dbHelper.recoverActivities;
              log.d('se insertó la actividad ${act.toString()}');
            },
            child: Icon(Icons.save_alt_rounded, size: 30),
          ),
          TextButton(
            onPressed: () {
              act = Activity(
                id: context.read<Appdata>().counter,
                fecha: '${context.read<Appdata>().counter}/05/2005',
                nombre: 'actividad ${context.read<Appdata>().counter}',
              );
              log.d('La variable act ahora es ${act.toString()}');
            },
            child: Icon(Icons.new_label, size: 30),
          ),
          TextButton(
            onPressed: () {
              Activity tempAct = act;
              act = Activity(
                id: context.read<Appdata>().counter,
                fecha: '${context.read<Appdata>().counter}/05/2005',
                nombre: context.read<Appdata>().username,
              );
              _dbHelper.updateActivity(act);
              act = tempAct;
              loadActivities();

              //log.d('La actividad con id: ${context.read<Appdata>().counter} se actualizó');
            },
            child: Icon(Icons.update, size: 30),
          ),
          TextButton(
            onPressed: () {
              _dbHelper.deleteActivity(context.read<Appdata>().counter);
              loadActivities();

              //log.d('La actividad con id: ${context.read<Appdata>().counter} se eliminó');
            },
            child: Icon(Icons.delete_forever, size: 30),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_return_sharp, size: 30),
          ),
        ],
      ),
    );
  }
}
