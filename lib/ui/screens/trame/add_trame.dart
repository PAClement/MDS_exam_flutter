import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../models/model_trame.dart';
import '../../../repositories/TrameRepository.dart';

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
          child: Column(children: [
            Card(
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                  labelText: 'Arrêt de trames',
                ),
                onChanged: (value) async {
                  if (value.length >= 2) {
                    final TrameRepository trameRepo = TrameRepository();

                    final List<ModelTrame> data =
                    await trameRepo.fetchStopTrame(value);

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
                    title: Text(item.stopname),
                    subtitle: Text(item.wheelchairboarding),
                    onTap: () {
                      Navigator.of(context).pop(item);
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
