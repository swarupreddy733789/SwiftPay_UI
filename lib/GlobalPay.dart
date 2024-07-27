import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/glassmorphism.dart';
import 'package:SwiftPay/transfer.dart';
import 'dart:ui';

class Globalpay extends StatefulWidget {
  final String s;
  const Globalpay({super.key, required this.s});
  @override
  State<Globalpay> createState() => _GlobalpayState();
}

class _GlobalpayState extends State<Globalpay> {
  late double d;
  late String s;
  String _selectedCity = 'USA';
  List<String> _cities = ['USA', 'INDIA', 'EUROPEAN', 'JAPAN', 'CHINA'];
  var a1 = ['US', 'IN', 'GB', 'JP', 'CN'];
  final TextEditingController _controller = TextEditingController();
  var a = ['USD', 'RUPEE', 'EURO', 'YEN', 'YUAN'];
  var b = [0.012, 1, 0.011, 1.88, 0.087];
  String collectedData = '0';
  Color borderColor = Colors.black;
  void initState() {
    super.initState();
    _controller.addListener(_collectData);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _collectData() {
    setState(() {
      if (_controller.text == '') {
        collectedData = '0';
      } else {
        collectedData = _controller.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Global Transfer'),
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 236, 235, 232),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 50,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF161616),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '   Transfer to:',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(225, 255, 254, 249)),
                  ),
                ),
                SizedBox(
                  height: 1.0,
                ),
                DropdownButtonFormField<String>(
                  dropdownColor: borderColor,
                  value: _selectedCity,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value!;
                      borderColor = borderColor;
                    });
                  },
                  items: _cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 30,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 6, right: 6),
                            child: CountryFlag.fromCountryCode(
                                a1[_cities.indexOf(city)]),
                          ),
                          Text(
                            city,
                            style: TextStyle(
                                color: Color.fromARGB(208, 255, 254, 249),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    fillColor: Color(0xFFFFFEF9),
                    hintText: 'Select City',
                    contentPadding: EdgeInsets.only(left: 20),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          GlassMorphism(
            blur: 0,
            opacity: 0.5,
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            borderRadius: 10,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: 'Enter the Amount',
                //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                icon: Icon(Icons.account_balance_wallet),
                border: InputBorder.none,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 138, 138, 138),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Color.fromARGB(35, 0, 0, 0)),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://t3.ftcdn.net/jpg/04/68/82/16/360_F_468821648_taDRtmbLfA6MuAuWJkHWLytHLlFdK1hb.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: Text(
                  'You send',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              Positioned(
                top: 65,
                left: 34,
                child: Text(
                  'RUPEE',
                  style: TextStyle(
                    color: Color.fromARGB(187, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 75,
                left: 30,
                child: Text(
                  'Recipeints get',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              Positioned(
                bottom: 40,
                left: a[_cities.indexOf(_selectedCity)].length.toDouble() + 33,
                child: Text(
                  '${a[_cities.indexOf(_selectedCity)]}',
                  style: TextStyle(
                      color: Color.fromARGB(187, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 60,
                right: 40,
                child: Text(
                  '${collectedData}',
                  style: TextStyle(
                      color: Color.fromARGB(187, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Positioned(
                bottom: 40,
                right: 40,
                child: Text(
                  '${double.parse((double.parse(collectedData) * b[_cities.indexOf(_selectedCity)]).toStringAsFixed(2))}',
                  style: TextStyle(
                      color: Color.fromARGB(187, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.height * 0.1,
          right: MediaQuery.of(context).size.height * 0.1,
          bottom: MediaQuery.of(context).size.height * 0.1,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                d = double.parse((double.parse(collectedData) *
                        b[_cities.indexOf(_selectedCity)])
                    .toStringAsFixed(2));
                s = a[_cities.indexOf(_selectedCity)];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Transfer(d: d, s: s),
                  ),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFEF9)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                textStyle: const TextStyle(
                    color: Color(0xFFFFFEF9),
                    fontSize: 25,
                    fontStyle: FontStyle.normal),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
