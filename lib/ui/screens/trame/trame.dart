import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keskistram/ui/screens/trame/trame_map.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../blocs/stop_trame_cubit.dart';
import '../../../models/model_trame.dart';

class Trame extends StatefulWidget {
  const Trame({super.key});

  @override
  _Trame createState() => _Trame();
}

class _Trame extends State<Trame> {
  int _selectedIndex = 1;
  var arrivee;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.of(context).pop("/home");
    }
  }

  fetchHoraire(stopName) async {
    final url = Uri.parse(
        'https://data.angers.fr/api/records/1.0/search/?dataset=bus-tram-circulation-passages&q=&facet=mnemoligne&facet=nomligne'
        '&facet=dest&facet=mnemoarret&facet=nomarret&facet=numarret&refine.mnemoarret=$stopName');

    final response = await http.get(url);
    var data = json.decode(response.body);
    if (data["records"]?.isEmpty ?? true) {
      setState(() {
        arrivee = null;
      });
    } else {
      String formatDate(String dateTimeString) {
        DateTime dateTime = DateTime.parse(dateTimeString);
        DateFormat formatter = DateFormat('mm:ss');
        String formatted = formatter.format(dateTime);
        return formatted;
      }

      setState(() {
        arrivee = formatDate(data["records"][0]["fields"]["arriveetheorique"]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(32, 1, 34, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: const Text(
                'FAVORIS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TrameCubit, List<ModelTrame>>(
                  builder: (BuildContext context, List<ModelTrame> stopTrames) {
                return ListView.separated(
                  itemCount: stopTrames.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ModelTrame stopTrame = stopTrames[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Card(
                        color: const Color.fromRGBO(100, 100, 100, 0.5),
                        child: ListTile(
                          onTap: () async {
                            await fetchHoraire(stopTrame.stop_id);
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: const Color.fromRGBO(15, 15, 15, 1),
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      111, 0, 0, 1),
                                            ),
                                            child:
                                                const Icon(Icons.location_on),
                                            onPressed: () =>
                                                Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => TrameMap(
                                                    selectStopTrame: stopTrame
                                                        .stop_coordinates),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            stopTrame.stop_name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      111, 0, 0, 1),
                                            ),
                                            child: const Icon(Icons.close),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 30),
                                        child: Column(
                                          children: [
                                            if (arrivee == null)
                                              const Text(
                                                "Aucune donnée pour le moment",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            if (arrivee != null)
                                              Text(
                                                "Arrivé théorique - $arrivee",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          leading: const Icon(Icons.tram, color: Colors.white),
                          title: Text(
                            stopTrame.stop_name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(height: 0);
                  },
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(15, 15, 15, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoris',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(111, 0, 0, 1),
          onPressed: () {
            Navigator.of(context).pushNamed('/addTrame');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
