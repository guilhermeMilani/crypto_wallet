import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/model/crypto_entity.dart';
import '../../shared/utils/currency_formater.dart';



class CryptoGrafic extends StatelessWidget {
  const CryptoGrafic({
    Key? key,
    required this.daysGraf,
    required this.model,
  }) : super(key: key);

  final StateController<int> daysGraf;
  final StateController<CryptoEntity> model;

  @override
  Widget build(BuildContext context) {
    List<FlSpot> crateGrafic() {
      List<FlSpot> days = [];
      for (int i = 0; i < daysGraf.state; i++) {
        days.add(FlSpot(double.parse(i.toString()),
            model.state.valueActual.reversed.toList()[i]));
      }

      return days;
    }

    double minY() {
      double minValue = double.infinity;
      for (var i = 0; i < daysGraf.state; i++) {
        minValue = model.state.valueActual.reversed.toList()[i] < minValue
            ? model.state.valueActual.reversed.toList()[i]
            : minValue;
      }

      return minValue;
    }

    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: daysGraf.state.toDouble() - 1,
          minY: minY() * 0.9,
          maxY: 1.5 * model.state.valueActual[0],
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: crateGrafic(),
              color: Colors.red,
              belowBarData:
                  BarAreaData(show: true, color: Colors.red.withOpacity(0.20)),
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.grey.shade800,
              getTooltipItems: (data) {
                return data.map(
                  (item) {
                    return LineTooltipItem(
                      realMoney.format(item.y),
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ),
        ),
      ),
    );
  }
}