import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

List<Map<String, String>> recentTitles = [
    {
      "title": "MD Faisal",
      "subtitle": "***** **** 1932",
    },
    {
      "title": "SAAS",
      "subtitle": "***** **** 8345",
    },
    {
      "title": "Naruto",
      "subtitle": "***** **** 9832",
    },
    {"title": "Sasuke", "subtitle": "***** **** 0024"},
    {
      "title": "Itachi",
      "subtitle": "***** **** 6288",
    },
    {
      "title": "Jiraya",
      "subtitle": "***** **** 0106",
    }
  ];

  List<IconData> recentIcons = [
    Icons.credit_card,
    Icons.phone_android,
    Icons.send_to_mobile,
    Icons.account_balance_wallet,
    Icons.swap_horiz,
    Icons.wallet_giftcard
  ];

  List<String> recentTrails = [
    "\$36.00",
    "\$239.00",
    "\$389.00",
    "\$98.00",
    "\$536.00",
    "\$106.00"
  ];

class _IncomeState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          height: 70,
          width: 100,
          child: ListTile(
            leading: const Text(
              "Transaction Activity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            trailing: TextButton(
              onPressed: () => {},
              child: const Text(
                "view all",
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
              Icons.send_to_mobile,
              size: 30,
            ),
            title: Text(
              "NARUTO",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "**** **** 9832",
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
                    "\$389.00",
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
              Icons.account_balance_wallet,
              size: 30,
            ),
            title: Text(
              "SASUKE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "**** **** 0024",
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
                    "\$98.00",
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
              Icons.swap_horiz,
              size: 30,
            ),
            title: Text(
              "Itachi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "**** **** 6288",
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
                    "\$145.00",
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
