import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  //List<Widget> navegationButtons = <Widget>[];

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
              children: <Widget>[const Text('Informacion relevante')],
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
