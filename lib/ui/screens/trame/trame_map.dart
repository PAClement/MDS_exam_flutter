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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(center: LatLng(23.7, 90.3), zoom: 8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
