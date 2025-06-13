import 'dart:io';

import 'package:application_laboratorio/pages/activity_content.dart';
import 'package:application_laboratorio/pages/picture_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/preferences.dart';
import 'package:application_laboratorio/Provider/app_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        length: 2,
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
    //logger.d('TestWidge didUpdateWidget, mounted: $mounted');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  bool _isResetAvailible = false;
  int _imageIndex = 0;
  late CameraDescription firstCamera;
  late List<CameraDescription> cameras;
  String? _imagePath;
  //final List<String?> _imagePaths = [];

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
  Future<void> _loadCameras() async {
    cameras = await availableCameras();
    setState(() {
      firstCamera = cameras.first;
    });
  }

  String _imageUrl = 'https://picsum.photos/250?image=0';

  void setImageToSearch() async {
    _imageIndex = context.read<Appdata>().counter;

    final newImageUrl = 'https://picsum.photos/250?image=$_imageIndex';

    try {
      final response = await http.head(Uri.parse(newImageUrl));
      if (response.statusCode == 200 || response.statusCode == 404) {
        setState(() {
          _imageUrl = newImageUrl;
        });
      } else {
        setState(() {
          _imageUrl = ''; // Clear the image URL
        });
      }
    } catch (e) {
      setState(() {
        _imageUrl = ''; // Clear the image URL
      });
    }

    setState(() {});
  }

  void isResetAvailible() {
    if (_isResetAvailible) {
      context.read<Appdata>().resetCounter();
    } else {
      logger.d("no hizo nada");
      null;
    }
  }

  void setNewBool() {
    context.read<Appdata>().setResetWidget(_isResetAvailible);
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetAvailible = prefs.getBool('isResetAvailible') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _loadCameras();
    //logger.d('initState, mounted: $mounted');
    logger.d('$_isResetAvailible');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //logger.d('didChangeDependencies, mounted: $mounted');
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    //logger.d('setState, mounted: $mounted');
  }

  @override
  Widget build(BuildContext context) {
    // logger.d("build enter");
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
                  null;
                },
                child:
                    _imagePath != null
                        ? Image.file(
                          File(_imagePath!),
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                        )
                        : Image.network(
                          _imageUrl.isNotEmpty ? _imageUrl : '',
                          width: 250,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                'No se pudo cargar la imagen',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
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
      TextButton(onPressed: setImageToSearch, child: Icon(Icons.image_search)),
    ];
  }

  void _openCamera(BuildContext context) async {
    final imagePath = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => PictureScreen(camera: cameras.first),
      ),
    );

    if (imagePath != null) {
      setState(() {
        _imagePath = imagePath;
        //_imagePaths.add(_imagePath);
        context.read<Appdata>().imagePaths.add(_imagePath);
      });
    }
  }

  List<Widget> navegationButtons() {
    return <Widget>[
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Preferences()),
          ).then((_) {
            _loadPreferences();
            logger.d('ok ahora es $_isResetAvailible');
          });

          /*Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListContent()),
          );*/
        },

        child: Icon(Icons.save, size: 50),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ActivityContent()),
          );
        },

        child: Icon(Icons.dataset, size: 50),
      ),
      TextButton(
        onPressed: () {
          _openCamera(context);
        },
        child: Icon(Icons.camera, size: 50),
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // logger.d('didUpdateWidget, mounted: $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    //logger.d('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    // logger.d('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    // logger.d('reassemble, mounted: $mounted');
  }
}
