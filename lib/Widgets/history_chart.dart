import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soil_health_monitoring_app/Model/soil_data.dart';

class HistoryChart extends StatelessWidget {
  final List<SoilData> allreadings;
  final bool isTemperature;

  const HistoryChart({
    super.key,
    required this.allreadings,
    required this.isTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              allreadings.length,
              (index) => FlSpot(
                index.toDouble(),
                isTemperature
                    ? allreadings[index].temperature
                    : allreadings[index].moisture,
              ),
            ),
            isCurved: true,
            color: Colors.blue,
          
          ),
        ],
      ),
    );
  }
}
