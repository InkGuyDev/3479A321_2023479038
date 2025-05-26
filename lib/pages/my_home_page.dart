import 'package:application_laboratorio/pages/list_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/about.dart';
import 'package:application_laboratorio/Provider/app_data.dart';
import 'package:provider/provider.dart';

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
    //logger.d("Logger is working!");
    return MaterialApp(
      title: 'Primera aplicación de Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 255, 98),
        ),
        fontFamily: 'LilitaOne',
      ),
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('Laboratorio Aplicación'),
            bottom: context.watch<Appdata>().tabBar(),
          ),
          body: context.watch<Appdata>().tabBarView(),
        ),
      ),
      //MyHomePage(title: 'Laboratorio aplicación'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key, required this.title});

  final String title;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Usuario: ${context.watch<Appdata>().username}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant TestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.d('TestWidge didUpdateWidget, mounted: $mounted');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;

  /*void _incrementCounter() {
    //logger.d("incrementó");

    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    //logger.d("disminuyó");

    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    //logger.d("reseteó");

    setState(() {
      _counter = 0;
    });
  }*/

  void isResetAvailible() {
    if (context.read<Appdata>().resetAvaliable) {
      context.read<Appdata>().resetCounter();
    } else {
      logger.d("no hizo nada");
      null;
    }
  }

  @override
  void initState() {
    super.initState();
    logger.d('initState, mounted: $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.d('didChangeDependencies, mounted: $mounted');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    logger.d('setState, mounted: $mounted');
  }

  @override
  Widget build(BuildContext context) {
    logger.d("build enter");
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
                  if (context.read<Appdata>().counter.isEven) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListContent(),
                      ),
                    );
                  } else if (context.read<Appdata>().counter.isOdd) {
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
                '${context.watch<Appdata>().counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: footerButtons(),
              ),
              Expanded(
                child: TestWidget(title: '${context.watch<Appdata>().counter}'),
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
      TextButton(
        onPressed: context.read<Appdata>().incrementCounter,
        child: Icon(Icons.add),
      ),
      TextButton(
        onPressed: context.read<Appdata>().decreaseCounter,
        child: Icon(Icons.exposure_minus_1),
      ),
      TextButton(
        onPressed: isResetAvailible, //context.read<Appdata>().resetCounter,
        child: Icon(Icons.exposure_zero),
      ),
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
          /*Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListContent()),
          );*/
        },

        child: Icon(Icons.skip_next, size: 90),
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.d('didUpdateWidget, mounted: $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    logger.d('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    logger.d('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.d('reassemble, mounted: $mounted');
  }
}
