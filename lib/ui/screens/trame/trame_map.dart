import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../blocs/stop_trame_cubit.dart';
import '../../../models/model_trame.dart';

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
        body:  Column(
          children: [
            Expanded(
              child: BlocBuilder<TrameCubit, List<ModelTrame>>(
                builder: (BuildContext context, List<ModelTrame> stopTrames) {
                  return FlutterMap(
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
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
