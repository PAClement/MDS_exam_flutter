import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../models/model_trame.dart';
import '../../../repositories/TrameRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/stop_trame_cubit.dart';

class AddTrame extends StatefulWidget {
  const AddTrame({super.key});

  @override
  State<AddTrame> createState() => _AddTrame();
}

class _AddTrame extends State<AddTrame> {
  List<ModelTrame> _stopTrames = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Card(
          color: const Color.fromRGBO(32, 1, 34, 1),
          child: Column(children: [
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
            Card(
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                ),
                onChanged: (value) async {
                  if (value.length >= 2) {
                    final TrameRepository trameRepo = TrameRepository();

                    final List<ModelTrame> data =
                        await trameRepo.fetchStopTrame(value.toUpperCase());

                    setState(() {
                      _stopTrames = data;
                    });
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _stopTrames.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _stopTrames[index];

                  return ListTile(
                    tileColor: const Color.fromRGBO(200, 200, 200, 1),
                    title: Text(item.stop_name),
                    subtitle:
                        Text(item.stop_id),
                    onTap: () {
                      final ModelTrame modelTrame = ModelTrame(
                          item.recordid,
                          item.stop_name,
                          item.stop_id,
                          item.wheelchair_boarding,
                          item.stop_coordinates);

                      context.read<TrameCubit>().addStopTrames(modelTrame);
                      Navigator.of(context).pop();
                    },
                  );
                },
                separatorBuilder: ((BuildContext context, int index) {
                  return const Divider(height: 0);
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
