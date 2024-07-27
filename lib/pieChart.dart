import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Pie extends StatefulWidget {
  const Pie({super.key});

  @override
  State<Pie> createState() => _PieState();
}

class _PieState extends State<Pie> {
  double h = 0, w = 0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 54,
                    color: const Color(0xFF161616),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFF161616),
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                  PieChartSectionData(
                    value: 1,
                    color: const Color(0xFFFFFEF9),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFFFFFEF9),
                      fontSize: 2,
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                  PieChartSectionData(
                    value: 19,
                    color: const Color(0xFF8A8A8A),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFF8A8A8A),
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                  PieChartSectionData(
                    value: 1,
                    color: const Color(0xFFFFFEF9),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFFFFFEF9),
                      fontSize: 2,
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                  PieChartSectionData(
                    value: 24,
                    color: const Color(0xFFFFCA3A),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFFFFCA3A),
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                  PieChartSectionData(
                    value: 1,
                    color: const Color(0xFFFFFEF9),
                    radius: 70,
                    titleStyle: const TextStyle(
                      color: Color(0xFFFFFEF9),
                      fontSize: 2,
                    ),
                    badgePositionPercentageOffset: 1.2,
                  ),
                ],
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 70, // Creates the ring effect
                sectionsSpace: 0,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: FlexSize(w),
            child: Transform.rotate(
              angle: (22 / 42) - (22 / 7),
              child: const SizedBox(
                height: 100,
                width: 100,
                child: Text(
                  "JULY\n2024",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double FlexSize(double w) {
  if (w < 450) {
    return 0.400 * w;
  } else if (w < 650) {
    return 0.428 * w;
  } else if (w < 980) {
    return 0.45 * w;
  } else if (w < 1450) {
    return 0.465 * w;
  }
  return 0.473 * w;
}
