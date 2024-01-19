import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'plant_model.dart';
import 'order_model.dart';

class SeasonalPlants {
  static Future<List<Plant>> getPlantsForSeason(String season) async {
    QuerySnapshot plantSnapshot = await FirebaseFirestore.instance
        .collection('Plants')
        .where('season', isEqualTo: season)
        .get();

    List<Plant> plants = [];

    for (QueryDocumentSnapshot doc in plantSnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      plants.add(Plant.fromJson(data));
    }

    return plants;
  }

  static Future<List<String>> getOrder(String userID) async {
    OrderModel orderModel;
    DocumentSnapshot result =
        await FirebaseFirestore.instance.collection("Orders").doc(userID).get();

    if (result.exists) {
      Map<String, dynamic> data = result.data() as Map<String, dynamic>;
      orderModel = OrderModel.fromJson(data);
    } else {
      List<String> emptyList = [];
      orderModel = OrderModel(emptyList);
    }

    return orderModel.plantNames;
  }

  static Future<void> buyPlant(String userID, String plantName) async {
    OrderModel orderModel;
    DocumentSnapshot result =
        await FirebaseFirestore.instance.collection("Orders").doc(userID).get();

    if (result.exists) {
      print(result.data());

      Map<String, dynamic> data = result.data() as Map<String, dynamic>;
      orderModel = OrderModel.fromJson(data);
    } else {
      List<String> emptyList = [];
      orderModel = OrderModel(emptyList);
    }

    orderModel.plantNames.add(plantName);

    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(userID)
        .set({'plantNames': orderModel.plantNames});
  }
}
