import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_health_monitoring_app/Provider/reading_provider.dart';
import 'package:soil_health_monitoring_app/Widgets/history_chart.dart';

class HistoryScreen extends StatefulWidget{
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isLoading =true;

  @override
  void initState(){
    super.initState();
    chartData();
  }
  Future<void> chartData() async{
    await Provider.of<ReadingProvider>(context, listen: false).allReadingsForChart();
    setState(() {
      isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
final allReadings =Provider.of<ReadingProvider>(context).allReadings;
    return Scaffold(appBar: AppBar(
      title: Center(
        child: Text("History", style: TextStyle(fontSize: 25,),
            ),
      ),
      backgroundColor: Color.fromARGB(255, 191, 219, 247),
    ),
    body: isLoading?
    Center(child: CircularProgressIndicator(),)
    : allReadings.isEmpty?
    Center(child: Text("No data"),)
    :Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
                Text("Graph for Temperature with time", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:300, child: HistoryChart(allreadings: allReadings, isTemperature: true,),),
                SizedBox(height: 30,),
                Text("Graph for Moisture with time", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height:300, child: HistoryChart(allreadings: allReadings, isTemperature: false,),),
              
              ],
              
              ),
          ),
          ),
        );

    
  }
}

