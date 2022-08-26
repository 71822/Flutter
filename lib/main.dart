import 'package:flutter/material.dart';
import 'Accueil.dart';
import 'home_page.dart';
import 'PageDeux.dart';
//import 'package:flutter_exam/home_page.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('CameraError: ${e.description}');
  }
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = const [
    Accueil(),
    HomePage(),
    PageDeux(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('devHybride'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8),
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          iconSize: 40,
          //selectedFontSize: 25,
          //unselectedFontSize: 16,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Accueil',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'PageUn',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
              label: 'PageDeux',
              //backgroundColor: Colors.blue,
            ),
          ]),
    );
  }
}
