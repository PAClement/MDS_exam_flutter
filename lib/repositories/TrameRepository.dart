import 'dart:convert';
import 'package:http/http.dart';
import '../models/model_trame.dart';

class TrameRepository{
  Future<List<ModelTrame>> fetchStopTrame(String query) async{

    final Response response = await get(
      Uri.parse('https://data.angers.fr/api/records/1.0/search/?'
          'dataset=horaires-theoriques-et-arrets-du-reseau-irigo-gtfs'
          '&q=$query&facet=stop_name&facet=wheelchair_boarding&facet=stop_id')
    );

      final List<ModelTrame> stopTrames = [];

      final Map<String, dynamic> json = jsonDecode(response.body);
      if(json.containsKey("records")){
        final List<dynamic> records = json['records'];

        for (Map<String, dynamic> record in records){
          final ModelTrame stopTrame = ModelTrame.fromGeoJson(record);


          stopTrames.add(stopTrame);
        }
      }

      return stopTrames;
  }

  Future<List<ModelTrame>> fetchTrameNearStopTrame(String query) async{

    final List<ModelTrame> tramesNearStopTrame = [];

    return tramesNearStopTrame;
  }
}