import 'package:flutter/material.dart';
import 'package:tech_taste/model/dish.dart';

import 'package:tech_taste/model/restaurant.dart';
import 'package:tech_taste/ui/_core/widgets/appbar.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 132),
            Text(
              'Mais pedidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Column(
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    'assets/dishes/default.png',
                    width: 52,
                    height: 52,
                  ),
                  title: Text(
                    dish.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('R\$${dish.price.toStringAsFixed(2)}'),
                  trailing: IconButton(icon: Icon(Icons.add), onPressed: () {}),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
