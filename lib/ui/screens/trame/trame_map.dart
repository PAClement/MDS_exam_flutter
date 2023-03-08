import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TrameMap extends StatefulWidget {
  const TrameMap({Key? key}) : super(key: key);

  @override
  State<TrameMap> createState() => _TrameMapState();
}

class _TrameMapState extends State<TrameMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  FlutterMap(
          options: MapOptions(
            center: LatLng(47.478419, -0.563166),
            zoom: 10.0,
          ),
          children: [
            TileLayer(
              urlTemplate:
              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            ElevatedButton(
              child: Text('<-'),
              onPressed: () {
                Navigator.of(context).pop('/trame');
              },
            ),
          ],
        ),
      ),
    );
  }
}
