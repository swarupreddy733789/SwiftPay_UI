import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/pin2.dart';

class MyPlan extends StatefulWidget {
  final String a, b;
  const MyPlan({super.key, required this.a, required this.b});
  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  List<String> _names = [
    '349',
    '379',
    '579',
    '299',
    '859',
    '409',
    '979',
    '1199',
    '3999',
  ];
  var da = [
    '2.0GB/day',
    '2.0GB/day',
    '1.5GB/day',
    '1.5GB/day',
    '2.0GB/day',
    '2.5GB/day',
    '2.0GB/day',
    '2.5GB/day',
    '2.5GB/day',
  ];
  var va = [
    '28 days',
    '1 month',
    '56 days',
    '28 days',
    '84 days',
    '28 days',
    '84 days',
    '84 days',
    '365 days'
  ];
  List<String> _filteredNames = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredNames = _names;
  }

  void _filterNames(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredNames = _names
          .where((name) => name.toLowerCase().contains(_searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Recharge'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: 'Search by plan',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _filterNames,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Divider(),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                'Plans',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: _filteredNames.isNotEmpty
                ? ListView.separated(
                    itemCount: _filteredNames.length,
                    itemBuilder: (context, index) {
                      String name = _filteredNames[index];
                      return GestureDetector(
                        onTap: () {
                          String a = widget.a;
                          String b = widget.b;
                          String c = "hello";
                          double d = double.parse(name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Verify(a: a, b: b,c:c,d: d),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Color(0x0F8A8A8A),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              left: 20,
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            tx(70, 20, 0, 0, 'Calls:', 13),
                            tx(90, 20, 0, 0, 'Data:', 13),
                            tx(110, 20, 0, 0, 'SMS:', 13),
                            tx(130, 20, 0, 0, 'Validity:', 13),
                            tx(70, 60, 0, 0, 'Unlimited', 13),
                            tx(90, 60, 0, 0, da[index], 13),
                            tx(110, 60, 0, 0, '100/day', 13),
                            tx(130, 75, 0, 0, va[index], 13),
                            tx(40, 180, 20, 0, 'Data:', 13),
                            tx(30, 270, 40, 0, 'Validity:', 13),
                            tx(70, 180, 170, 0, da[index], 13),
                            tx(70, 270, 0, 0, va[index], 13),
                            Positioned(
                              top: 10,
                              left: 20,
                              child: SizedBox(
                                height: 20,
                                width: double.parse(name) > 350 ? 170 : 115,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    double.parse(name) > 350
                                        ? "Free Unlimited 5G"
                                        : "Bestseller",
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 30,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    //color: Colors.black,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/airtel.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                  )
                : Center(child: Text('No Plans Found')),
          ),
        ],
      ),
    );
  }

  Positioned tx(double a, double b, double c, double d, String s, double e) {
    return Positioned(
      top: a,
      left: b,
      right: c,
      bottom: d,
      child: Text(
        s,
        style: TextStyle(fontSize: e, fontWeight: FontWeight.bold),
      ),
    );
  }
}
