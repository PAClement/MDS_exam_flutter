import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.9],
            colors: [
              Color.fromRGBO(32, 1, 34, 1),
              Color.fromRGBO(111, 0, 0, 1),
            ],
          )),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 100.0),
                  child: const Text(
                    'Keskistram ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(100, 100, 100, 0.5),
                    fixedSize: Size.fromHeight(100),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/trame");
                  },
                  child: const Text(
                    'Les Trames',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Text(
                    "Ajouter votre arrêt de trame à vos favoris, puis vous pourrez le voir sur la map et savoir quand le prochain trame arrive !",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
