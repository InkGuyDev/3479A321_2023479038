import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:application_laboratorio/Provider/app_data.dart';
import 'package:provider/provider.dart';

class Preferences extends StatefulWidget {
  const Preferences({super.key});

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool _isResetAvailible = false;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetAvailible = prefs.getBool('isResetAvailible') ?? false;
    });
    //print('$_isResetAvailible');
    setNewBool();
  }

  Future<void> _savePreferences(bool newBool) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isResetAvailible', newBool);
    //print('guardo $newBool');
  }

  void setNewBool() {
    context.read<Appdata>().setResetWidget(_isResetAvailible);
  }

  void setOldToSave() {
    _isResetAvailible = context.read<Appdata>().resetAvaliable;
    //print('$_isResetAvailible');
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    //print('$_isResetAvailible');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 153, 0),
          title: Text('Preferencias'),
        ),
        body: Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Consumer<Appdata>(
                      builder: (context, model, child) {
                        return Switch(
                          value: model.resetAvaliable,
                          onChanged: (value) {
                            model.toggleResetWidget();
                            setOldToSave();
                          },
                        );
                      },
                    ),
                    Text(
                      'Botón de reset en pantalla Home',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 153, 0),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _savePreferences(_isResetAvailible);
            },
            child: Icon(
              Icons.keyboard_return_sharp,
              size: 90,
              color: const Color.fromARGB(255, 255, 153, 0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
