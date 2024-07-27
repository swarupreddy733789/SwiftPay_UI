import 'package:SwiftPay/GlobalPay.dart';
import 'package:SwiftPay/pay_bills.dart';
import 'package:SwiftPay/phonemoney.dart';
import 'package:SwiftPay/recharge.dart';
import 'package:SwiftPay/vouchers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:SwiftPay/quick_send_money.dart';
import 'package:SwiftPay/refers.dart';

class HomePage extends StatefulWidget {
  final ValueNotifier<int> selectedIndexNotifier;
  const HomePage({super.key, required this.selectedIndexNotifier});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "Emma";
  String currenDate = "";

  @override
  void initState() {
    super.initState();
    _updateDate();
  }

  void _updateDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, dd MMM').format(now);
    setState(() {
      currenDate = formattedDate;
    });
  }

  var a = [
    Globalpay(s: 'hello'),
    MyPhoneMoney(),
    VoucherList(),
    ContactsPage(
      recharge: true,
    ),
    BillsScreen(),
    ContactsPage1()
  ];
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
  List<String> quickNames = ["Jenny", "Wanda", "Steeve", "Hermoiny"];
  List<String> quickNumbers = [
    "1234567890",
    "9876543210",
    "9845231648",
    "9435261857"
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

  final List<String> dp_photos = [
    "https://i.pinimg.com/736x/0b/b9/b5/0bb9b572ebfa21d277cde6eb810fe353.jpg",
    "https://i.pinimg.com/564x/88/ca/ac/88caac212afa51a01c2e99564b8cdb63.jpg",
    "https://i.pinimg.com/736x/0b/cb/5c/0bcb5ca420a80e9ddc58f884a55c3dc3.jpg",
    "https://i.pinimg.com/564x/c5/f2/66/c5f2662c261a34e04dff99cb59b2812f.jpg"
  ];

  final List<String> gdnames = [
    "Globe Pay",
    "Send",
    "Rewards",
    "Recharge",
    "Bills",
    "Referals"
  ];

  final List<IconData> icons = [
    FontAwesomeIcons.globe,
    FontAwesomeIcons.share,
    FontAwesomeIcons.gifts,
    Icons.mobile_friendly,
    FontAwesomeIcons.receipt,
    Icons.bolt
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            widget.selectedIndexNotifier.value = 3;
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/10/cf/d9/10cfd983d2d0034cab387f9988146afa.jpg'),
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              "Hello, $username 👋🏻",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              currenDate,
              style: const TextStyle(fontSize: 19),
            )
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: const Color(0x0F8A8A8A), // Background color
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_outlined),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: const Color(0x0F8A8A8A), // Background color
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              height: 230,
              //color: Colors.red,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/dark-black-background-design-with-stripes_1017-38064.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1721606400&semt=ais_user',
                        fit: BoxFit.fill,
                        height: 230,
                        width: MediaQuery.of(context).size.width - 50,
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 40,
                      left: 20,
                      child: Text(
                        'Total Balance',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )),
                  const Positioned(
                      top: 70,
                      left: 20,
                      child: Text(
                        '536.36',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                  const Positioned(
                      bottom: 50,
                      left: 20,
                      child: Text(
                        'GlobeNum',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )),
                  const Positioned(
                      bottom: 25,
                      left: 20,
                      child: Text(
                        '36 53607218',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      )),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 60,
                      width: 56,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFEF9),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF161616),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.add_to_drive_rounded,
                          color: Color(0xFFFFFEF9),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      bottom: 25,
                      right: 25,
                      child: Text(
                        'SWIFTPAY',
                        style: TextStyle(
                            color: Color(0xFFFFCA3A),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                ],
              ),
            ),
            Container(
              height: 140,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.8),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => a[index]));
                      },
                      child: Container(
                        height: 30,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: const Color(0x0F8A8A8A),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icons[index],
                              size: gdnames[index] == "Rewards" ? 10 : 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              gdnames[index],
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 30,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: const Text(
                  'Quick Send',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            Container(
              height: 75,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, childAspectRatio: 1),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0x0F8A8A8A)),
                      child: index == 4
                          ? IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContactsPage(recharge: false)));
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 35,
                              ))
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuickSendMoney(
                                            name: quickNames[index],
                                            account: quickNumbers[index])));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dp_photos[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    );
                  }),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, bottom: 5, top: 3),
                  child: const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 5, top: 3),
                  child: const Text(
                    'View all',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            ListView.builder(
                itemCount: recentTitles.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0x0F8A8A8A)),
                    child: ListTile(
                      leading: Icon(recentIcons[index]),
                      title: Text(recentTitles[index]["title"]!),
                      subtitle: Text(recentTitles[index]["subtitle"]!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            recentTrails[index],
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
