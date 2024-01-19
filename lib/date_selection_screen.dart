import 'package:flutter/material.dart';
import 'plant_list_screen.dart';
import "order_page.dart";

class DateSelectionScreen extends StatefulWidget {
  @override
  _DateSelectionScreenState createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  late DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantListScreen(selectedDate),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatPlant App - Select Date'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Container(
                  child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.asset('assets/img/logo.png', fit: BoxFit.cover),
            ),
          ))),
          SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Select a date to discover plants!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () => _selectDate(context),
            icon: const Icon(Icons.date_range_outlined),
            label: const Text('Select Date'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(userID: "Ahmet"),
                ),
              )
            },
            icon: const Icon(Icons.money_off_csred_rounded),
            label: const Text('Show Orders'),
          )
        ],
      ),
    );
  }
}
