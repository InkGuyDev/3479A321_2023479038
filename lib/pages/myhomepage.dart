import 'package:application_laboratorio/pages/list_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/about.dart';

Logger logger = Logger();

const String assetName = 'assets/icons/9040517_outlet_icon.svg';
final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Dart Logo',
  width: 200,
  height: 200,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d("Logger is working!");
    return MaterialApp(
      title: 'Primera aplicación de Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 255, 98),
        ),
        fontFamily: 'LilitaOne',
      ),
      home: const MyHomePage(title: 'Laboratorio aplicación'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    logger.d("incrementó");

    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    logger.d("disminuyó");

    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    logger.d("reseteó");

    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  if (_counter % 2 == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListContent(),
                      ),
                    );
                  } else if (_counter % 2 != 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  }
                },
                child: svg,
              ),
              const Text('Haz presionado el botón esta cantidad de veces:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: footerButtons(),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: navegationButtons(),
    );
  }

  List<Widget> footerButtons() {
    return <Widget>[
      TextButton(onPressed: _incrementCounter, child: Icon(Icons.add)),
      TextButton(
        onPressed: _decreaseCounter,
        child: Icon(Icons.exposure_minus_1),
      ),
      TextButton(onPressed: _resetCounter, child: Icon(Icons.exposure_zero)),
    ];
  }

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
  }
}
