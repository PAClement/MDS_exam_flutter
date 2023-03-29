import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../blocs/stop_trame_cubit.dart';
import '../../../models/model_trame.dart';

class TrameMap extends StatefulWidget {
  final List selectStopTrame;

  const TrameMap({super.key, required this.selectStopTrame});

  @override
  State<TrameMap> createState() => _TrameMapState();
}

class _TrameMapState extends State<TrameMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(15, 15, 15, 1),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(111, 0, 0, 1),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                onPressed: () {
                  Navigator.of(context).pop('/trame');
                },
              ),
              Expanded(
                child: BlocBuilder<TrameCubit, List<ModelTrame>>(builder:
                    (BuildContext context, List<ModelTrame> stopTrames) {
                  return FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                          widget.selectStopTrame[0], widget.selectStopTrame[1]),
                      zoom: 15.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(widget.selectStopTrame[0],
                                widget.selectStopTrame[1]),
                            builder: (ctx) => const Icon(Icons.pin_drop,
                                color: Colors.red, size: 30),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
