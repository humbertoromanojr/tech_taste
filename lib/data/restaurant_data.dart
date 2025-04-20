import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:tech_taste/model/restaurant.dart';

class RestaurantData {
  Future<List<Restaurant>> getRestaurants() async {
    List<Restaurant> listRestaurant = [];

    String jsonString = await rootBundle.loadString('assets/data.json');

    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (int i = 0; i < restaurantsData.length; i++) {
      listRestaurant.add(Restaurant.fromMap(restaurantsData[i]));
    }

    return listRestaurant;
  }
}
