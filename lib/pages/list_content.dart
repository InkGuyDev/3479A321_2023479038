import 'package:flutter/material.dart';
import 'package:application_laboratorio/pages/about.dart';

final List<String> elementos = ['Hola', 'Mundo', 'Texto de Ejemplo'];

class ListContent extends StatelessWidget {
  const ListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 126, 40, 61),
          title: Text('Lista de Contenidos'),
        ),
        body: ListView.builder(
          itemCount: elementos.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(elementos[index]));
          },
        ),
        persistentFooterButtons: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const About()),
              );
            },
            child: Icon(Icons.skip_next, size: 200),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.keyboard_return, size: 200),
          ),
        ],
      ),
    );
  }
}
