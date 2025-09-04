import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_health_monitoring_app/Provider/reading_provider.dart';
import 'package:soil_health_monitoring_app/Screens/bluetooth_connection.dart';
import 'package:soil_health_monitoring_app/Screens/history_screen.dart';
import 'package:soil_health_monitoring_app/Widgets/elevated_button.dart';
import 'package:soil_health_monitoring_app/Widgets/reading_card.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final readingProvider = Provider.of<ReadingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Soil Health")),
        backgroundColor: Color.fromARGB(255, 191, 219, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Check Your Soil!!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Elevatedbutton(
                    text: 'Test',
                    onPressed: () {
                      print("working fine");
                      readingProvider.testNewReading();
                    },
                  ),
                  SizedBox(width: 15),
                  Elevatedbutton(
                    text: 'Report',
                    onPressed: () async {
                      print("working fine");
                      await readingProvider.reportLastReading(3);
                    },
                  ),
                  SizedBox(width: 15),
                  Elevatedbutton(
                    text: 'History',
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HistoryScreen()));
                    },
                  ),
                ],
              ),
              Consumer<ReadingProvider>(
                builder:
                    (
                      BuildContext context,
                      ReadingProvider readingProvider,
                      Widget? child,
                    ) {
                      if (readingProvider.reading != null) {
                        return ReadingCard(data: readingProvider.reading!);
                      } else if (readingProvider.latestReadings.isNotEmpty) {
                        return Column(
                          children: readingProvider.latestReadings.map((
                            latestReading,
                          ) {
                            return ReadingCard(data: latestReading);
                          }).toList(),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 15),
                child: Elevatedbutton(
                  text: "Connect Device",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BluetoothConnection(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
