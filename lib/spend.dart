import 'package:flutter/material.dart';
import 'package:SwiftPay/pieChart.dart';

class Spend extends StatefulWidget {
  const Spend({super.key});

  @override
  State<Spend> createState() => _SpendState();
}

class _SpendState extends State<Spend> {
  double h = 0, w = 0;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.sizeOf(context).height;
    w = MediaQuery.sizeOf(context).width;
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: FlexSize(w)),
          height: 45,
          width: 100,
          child: const Text(
            "\$488.24",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        Container(
          height: 30,
          width: 100,
          margin: EdgeInsets.only(left: FlexSize(w)),
          child: const Text(
            "Total Spend",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Transform.rotate(
          angle: (22 / 7) - (22 / 42),
          child: const SizedBox(
            height: 200,
            width: 200, // Set a fixed height
            child: Pie(),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 70,
          width: 100,
          child: ListTile(
            leading: const Text(
              "Send Activity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: TextButton(
              onPressed: () => {},
              child: const Text(
                "see all",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF161616),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0x0F8A8A8A),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const ListTile(
            leading: Icon(
              Icons.credit_card,
              size: 30,
            ),
            title: Text(
              "MD Faisal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "**** **** 1932",
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: SizedBox(
              height: 80,
              width: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "\$45.00",
                    style: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xFF8A8A8A),
                    size: 23,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0x0F8A8A8A),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: const ListTile(
            leading: Icon(
              Icons.phone_android,
              size: 30,
            ),
            title: Text(
              "SAAS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "**** **** 8435",
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: SizedBox(
              height: 80,
              width: 100,
              child: Row(
                children: [
                  Text(
                    "\$239.00",
                    style: TextStyle(
                      color: Color(0xFF8A8A8A),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xFF8A8A8A),
                    size: 23,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

double FlexSize(double w) {
  if (w < 450) {
    return 0.35 * w;
  } else if (w < 650) {
    return 0.4 * w;
  } else if (w < 750) {
    return 0.42 * w;
  } else if (w < 1200) {
    return 0.45 * w;
  }
  return 0.46 * w;
}
