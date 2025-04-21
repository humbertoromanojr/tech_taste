import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:tech_taste/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];
  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');

    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (int i = 0; i < restaurantsData.length; i++) {
      listRestaurant.add(Restaurant.fromMap(restaurantsData[i]));
    }
  }
}
