import 'package:flutter/material.dart';
import 'package:keskistram/ui/screens/home.dart';
import 'package:keskistram/ui/screens/trame/trame.dart';
import 'package:keskistram/ui/screens/trame/trame_map.dart';
import 'package:keskistram/ui/screens/trame/add_trame.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      title: 'Keskistrame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/home': (context) => const Home(),
        '/trame': (context) => const Trame(),
        '/trameMap': (context) => const TrameMap(),
        '/addTrame': (context) => const AddTrame(),
      },
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
