import 'package:SwiftPay/pin3.dart';
import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  BillsScreen({super.key});

  final List<Map<String, dynamic>> bills = [
    {'icon': Icons.lightbulb_outline, 'label': 'Electricity'},
    {'icon': Icons.local_fire_department, 'label': 'Gas'},
    {'icon': Icons.wifi, 'label': 'Internet'},
    {'icon': Icons.water_drop, 'label': 'Water'},
    {'icon': Icons.school, 'label': 'Education'},
    {'icon': Icons.health_and_safety, 'label': 'Insurance'},
    {'icon': Icons.credit_card, 'label': 'Credit Card'},
    {'icon': Icons.miscellaneous_services, 'label': 'Utility'},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: EdgeInsets.only(left: 10, top: 5, bottom: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 236, 235, 232),
            ),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Bills',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: Container(
              child: TabBar(
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(
                  color: Color(0xFF161616),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelColor: Color(0xFFFFFEF9),
                unselectedLabelColor: Color(0xFF161616),
                tabs: [
                  Container(
                    height: 45,
                    width: 200,
                    child: const Center(
                      child: Text(
                        "Pay",
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
                        "Receipts",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            buildBillsGrid(bills, context, true),
            buildBillsGrid(bills, context, false),
          ],
        ),
      ),
    );
  }

  Widget buildBillsGrid(
      List<Map<String, dynamic>> items, BuildContext context, bool isPay) {
    List<Widget> itemList = [];
    for (var item in items) {
      itemList.add(buildBillItem(item, context, isPay));
    }

    return GridView.count(
      padding: EdgeInsets.all(16.0),
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: itemList,
    );
  }

  Widget buildBillItem(
      Map<String, dynamic> item, BuildContext context, bool isPay) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            isPay
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AccountDetailsScreen(appBarName: item['label'])))
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Receipts(appBarName: item['label'])));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Icon(item['icon'], size: 40, color: Colors.black),
          ),
        ),
        SizedBox(height: 8.0),
        Text(item['label'],
            style: TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}

class Receipts extends StatelessWidget {
  final String appBarName;
  Receipts({super.key, required this.appBarName});

  final List<String> imageUrls = [
    'https://i.pinimg.com/564x/83/03/2a/83032a84403408bf56569ed02cf9262a.jpg',
    'https://i.pinimg.com/564x/09/f7/ea/09f7ea7be870224a38650ad88e89aedd.jpg',
    'https://i.pinimg.com/564x/37/e2/6f/37e26f0b31b389ecf8f4bcba43a5d07e.jpg',
    'https://i.pinimg.com/564x/7e/e5/df/7ee5dfc98b7f46b26c64e515da8a8f62.jpg',
    'https://i.pinimg.com/564x/59/c3/ac/59c3ac3315e1d5cab47ac18a02a9240a.jpg',
    'https://i.pinimg.com/564x/44/26/a7/4426a7ef70b8bf472a7779ef3bbfa1d2.jpg',
    'https://i.pinimg.com/564x/89/f5/8e/89f58e0334d55067644e1d4e9fbdafed.jpg',
    'https://i.pinimg.com/564x/31/dd/03/31dd03571fedbd5469e286181947821e.jpg',
    'https://i.pinimg.com/564x/02/6c/df/026cdf26bef821b606534bcf3d46543b.jpg',
    'https://i.pinimg.com/564x/6c/c1/ea/6cc1ea46cc2456ef9444374239947f02.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          appBarName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 236, 235, 232),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 13.0,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.9,
                                maxHeight:
                                    MediaQuery.of(context).size.height * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  imageUrls[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: 20,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AccountDetailsScreen extends StatefulWidget {
  final String appBarName;

  AccountDetailsScreen({super.key, required this.appBarName});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  String value = '';

  final TextEditingController serviceNumberController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.appBarName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 236, 235, 232),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter account details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 55,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color(0x0F8A8A8A),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: serviceNumberController,
                decoration: InputDecoration(
                  icon: Icon(Icons.numbers),
                  hintText: 'Enter your Service Number',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 55,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color(0x0F8A8A8A),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: amountController,
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_money),
                  hintText: 'Enter the amount',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This allows Swift Pay to fetch your current and future bills so that you can view and pay them.',
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                double b = double.tryParse(amountController.text) ?? 0.0;
                setState(() {
                  value = b.toStringAsFixed(2);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Verify(
                              a: widget.appBarName,
                              b: double.tryParse(value)!,
                            )));
              },
              child: Container(
                  width: 200,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF161616)),
                  child: const Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
