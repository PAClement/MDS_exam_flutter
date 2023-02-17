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
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            Text('Deliver features faster'),
            ElevatedButton(
              child: Text('Les trames ?'),
              onPressed: () {
                Navigator.of(context).pushNamed("/trame");
              },
            )
          ],
        ),
      ),
    );
  }
}
