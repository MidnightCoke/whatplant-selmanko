import 'package:flutter/material.dart';
import 'seasonal_plants.dart';

class PlantListScreen extends StatelessWidget {
  final DateTime selectedDate;

  PlantListScreen(this.selectedDate);

  String getSeason(DateTime date) {
    int month = date.month;

    if (month >= 3 && month <= 5) {
      return 'Spring';
    } else if (month >= 6 && month <= 8) {
      return 'Summer';
    } else if (month >= 9 && month <= 11) {
      return 'Autumn';
    } else {
      return 'Winter';
    }
  }

  @override
  Widget build(BuildContext context) {
    String season = getSeason(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Best Plants for $season'),
      ),
      body: FutureBuilder<List>(
        future: SeasonalPlants.getPlantsForSeason(season),
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
                    title: Text(plants[index].name),
                    tileColor: index % 2 == 0 ? Colors.white : Colors.white12,
                    subtitle: Text('Season: ${plants[index].season}'),
                    trailing: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: GestureDetector(
                        // BU kısımda satın alma işlemi gerçekleşiyor
                        onTap: () {
                          // Burada bitkinin adını yazdırabilirsiniz
                          print("${plants[index].name} satın alındı");

                          SeasonalPlants.buyPlant("Ahmet", plants[index].name);
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.lightGreenAccent[800],
                        ),
                      ),
                    ));
              },
            );
          }
        },
      ),
    );
  }
}
