import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/model_trame.dart';

class PreferencesRepository {
  Future<void> saveStopTrames(List<ModelTrame> modelTrames) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final ModelTrame modelTrame in modelTrames) {
      listJson.add(jsonEncode(modelTrame.toJson()));
    }
    prefs.setStringList('stop_trame', listJson);
  }

  Future<List<ModelTrame>> loadStopTrames() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('stop_trame') ?? [];
    final List<ModelTrame> modelTrames = [];
    for (String json in listJson) {
      final Map<String, dynamic> map = jsonDecode(json);
      final ModelTrame modelTrame = ModelTrame.fromJson(map);
      modelTrames.add(modelTrame);
    }

    return modelTrames;
  }
}