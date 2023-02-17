import 'dart:ui';

import 'package:flutter/material.dart';

class TrameMap extends StatefulWidget {
  const TrameMap({Key? key}) : super(key: key);

  @override
  State<TrameMap> createState() => _TrameMapState();
}

class _TrameMapState extends State<TrameMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text("MAP")],
        ),
      ),
    );
  }
}
