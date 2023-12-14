import 'dart:convert';
import 'package:flutter/services.dart';
import 'plant_model.dart';

class SeasonalPlants {
  static Future<List<Plant>> getPlantsForSeason(String season) async {
    final String jsonString =
        await rootBundle.loadString('assets/plants_data.json');
    final Map<String, dynamic> plantData = json.decode(jsonString);

    List<Plant> plants = [];

    if (plantData.containsKey(season)) {
      var plantList = plantData[season] as List<dynamic>;
      plants = plantList.map((json) => Plant.fromJson(json)).toList();
    }

    return plants;
  }
}
