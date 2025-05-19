import 'dart:async';

import 'package:flutter/material.dart';
import 'package:application_laboratorio/Provider/app_data.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  //List<Widget> navegationButtons = <Widget>[];
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          title: Text('Sobre'),
        ),
        body: Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${context.read<Appdata>().counter}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    fontSize: 50,
                  ),
                ),
                Row(
                  children: [
                    Consumer<Appdata>(
                      builder: (context, model, child) {
                        return Switch(
                          value: model.resetAvaliable,
                          onChanged: (value) {
                            model.toggleResetWidget();
                          },
                        );
                      },
                    ),
                    Text(
                      'Botón de reset en pantalla Home',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 102, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your username',
                    ),
                    onChanged: (text) {
                      context.read<Appdata>().setUserName(text);
                    },
                  ),
                ),
                Text(
                  'Usuario: ${context.watch<Appdata>().username}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 0, 0),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_return,
              size: 200,
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  /*
  List<Widget> navegationButtons() {
    return <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListContent()),
          );
        },

        child: Icon(Icons.skip_next, size: 200),
      ),
    ];
  }*/
}
