import 'package:flutter/material.dart';
import 'package:what_plant_midterm/seasonal_plants.dart';

class OrderPage extends StatelessWidget {
  final String userID;
  const OrderPage({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: FutureBuilder<List>(
        future: SeasonalPlants.getOrder(userID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> plants = snapshot.data!;
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(plants[index]),
                  tileColor: index % 2 == 0 ? Colors.white : Colors.white12,
                );
              },
            );
          }
        },
      ),
    );
  }
}
