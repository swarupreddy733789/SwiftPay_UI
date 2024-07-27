// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:SwiftPay/income.dart';
import 'package:SwiftPay/spend.dart';
import 'package:SwiftPay/graph.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  double h = 0.0, w = 0.0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 10),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Statistics",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          actions: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IconButton(
                icon: const Icon(Icons.calendar_month_outlined),
                iconSize: 20,
                color: const Color(0xFFFFFEF9),
                onPressed: () => {},
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: const Center(
                  child: Text(
                    "\$325.45",
                    style: TextStyle(
                      color: Color(0xFF161616),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
                width: MediaQuery.sizeOf(context).width,
                child: Center(
                  child: Text(
                    "Total Balance",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    child: CustomPaint(
                      foregroundPainter: RPSCustomPainter(),
                      child: Container(
                        height: 250,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: (w < 600)
                        ? 0.65 * w
                        : (w < 800)
                            ? 0.65 * w
                            : 0.66 * w,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFF161616),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: (w < 600) ? 0.7 * w : 0.685 * w,
                    child: const SizedBox(
                      height: 20,
                      child: Text(
                        "+100.45",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    child: Column(
                      children: [
                        Text(
                          "\$750",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          "\$500",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          "\$250",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          "\$0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 50,
                    child: Center(
                      child: Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                                width: (w < 400)
                                    ? 0.008 * w
                                    : (w < 600)
                                        ? 0.039 * w
                                        : (w < 800)
                                            ? 0.06 * w
                                            : (w < 1050)
                                                ? 0.08 * w
                                                : 0.093 * w),
                            const Text(
                              "Mon",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: FlexSize(w),
                            ),
                            const Text(
                              "Tue",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: FlexSize(w),
                            ),
                            const Text(
                              "Wed",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: FlexSize(w),
                            ),
                            const Text(
                              "Thu",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: FlexSize(w),
                            ),
                            const Text(
                              "Fri",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TabBar(
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(
                  color: Color(0xFF161616),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Color(0xFFFFFEF9),
                unselectedLabelColor: Color(0xFF161616),
                tabs: [
                  Container(
                    height: 50,
                    width: 200,
                    child: const Center(
                      child: Text(
                        "Income",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text(
                        "Spend",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 630,
                child: TabBarView(
                  children: [
                    Income(),
                    Spend(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

double FlexSize(double w) {
  if (w < 400) {
    return 0.12 * w;
  } else if (w < 480) {
    return 0.133 * w;
  } else if (w < 550) {
    return 0.143589 * w;
  } else if (w < 600) {
    return 0.15 * w;
  } else if (w < 650) {
    return 0.1565 * w;
  } else if (w < 700) {
    return 0.159 * w;
  } else if (w < 750) {
    return 0.162 * w;
  } else if (w < 800) {
    return 0.166 * w;
  } else if (w < 850) {
    return 0.168 * w;
  } else if (w < 900) {
    return 0.17 * w;
  } else if (w < 1150) {
    return 0.175 * w;
  } else if (w < 1300) {
    return 0.1795 * w;
  } else if (w < 1500) {
    return 0.184 * w;
  }
  return 0.1853 * w;
}
