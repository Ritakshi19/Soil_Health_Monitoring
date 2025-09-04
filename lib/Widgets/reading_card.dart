import 'package:flutter/material.dart';
import 'package:soil_health_monitoring_app/Model/soil_data.dart';


class ReadingCard extends StatelessWidget {
  final SoilData data;

  const ReadingCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final reading = data;
    return Card(
      color: Color.fromARGB(255, 171, 252, 171),
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Readings",
              style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text("Temperature: ${reading.temperature.toStringAsFixed(2)} °C",style: TextStyle(fontSize: 18),),
            Text("Moisture: ${reading.moisture.toStringAsFixed(2)} %",style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
