import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tech_taste/data/restaurant_data.dart' show RestaurantData;
import 'package:tech_taste/model/restaurant.dart';

import 'package:tech_taste/ui/_core/app_theme.dart';
import 'package:tech_taste/ui/home/home_screen.dart';
import 'package:tech_taste/ui/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: HomeScreen());
  }
}
