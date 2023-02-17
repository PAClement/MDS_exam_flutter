import 'dart:ui';

import 'package:flutter/material.dart';

class Trame extends StatefulWidget {
  const Trame({Key? key}) : super(key: key);

  @override
  State<Trame> createState() => _TrameState();
}

class _TrameState extends State<Trame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            Text('Deliver features faster'),
            ElevatedButton(
              child: Text('<- Vers le menu'),
              onPressed: () {
                Navigator.of(context).pop('/home');
              },
            ),
            ElevatedButton(
              child: Text('Vers la map ->'),
              onPressed: () {
                Navigator.of(context).pushNamed("/trameMap");
              },
            )
          ],
        ),
      ),
    );
  }
}
