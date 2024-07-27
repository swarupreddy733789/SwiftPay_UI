import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SwiftPay/pin.dart';

class Transferconfirm extends StatefulWidget {
  final String a, b, c;
  final double d;
  const Transferconfirm(
      {super.key,
      required this.a,
      required this.b,
      required this.c,
      required this.d});

  @override
  State<Transferconfirm> createState() => _TransferconfirmState();
}

class _TransferconfirmState extends State<Transferconfirm> {
  final date = DateTime.now();
  var a1 = ['USD', 'RUPEE', 'EURO', 'YEN', 'YUAN'];
  var a2 = ['US', 'IN', 'GB', 'JP', 'CN'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border:
                    Border.all(color: Color.fromARGB(10, 0, 0, 0), width: 2),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.197,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 138, 138, 138),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border(
                      bottom: BorderSide(color: Color.fromARGB(18, 0, 0, 0))),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.168,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.16,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20, top: 26),
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 138, 138, 138),
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(18, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3585,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.120,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(37, 138, 138, 138),
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromARGB(18, 0, 0, 0)))),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.479,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.085,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 138, 138, 138),
                  border: Border(
                    bottom: BorderSide(color: Color.fromARGB(18, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.564,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.084,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(37, 138, 138, 138),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                right: MediaQuery.of(context).size.width * 0.04 + 40,
                child: Icon(
                  FontAwesomeIcons.share,
                  size: 90,
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                'Sending\nMoney',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.16,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                date.toString().substring(0, 10),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(116, 0, 0, 0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.16,
              left: MediaQuery.of(context).size.width * 0.04 + 110,
              child: Text(
                date.toString().substring(10, 20),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(116, 0, 0, 0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.22,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                'Amount',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.27,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                '\$' + widget.d.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    //fontStyle: FontStyle.italic,
                    color: Color.fromARGB(234, 0, 0, 0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.28,
              right: MediaQuery.of(context).size.width * 0.13 +
                  widget.c.length * 3,
              child: Text(
                widget.c,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              right: MediaQuery.of(context).size.width * 0.08,
              child: Container(
                height: 50,
                width: 80,
                color: Colors.white,
                margin: EdgeInsets.only(top: 6, right: 6),
                child: CountryFlag.fromCountryCode(a2[a1.indexOf(widget.c)]),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                'Transaction ID',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              right: MediaQuery.of(context).size.width * 0.04 + 40,
              child: Text(
                'Transaction Type',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.42,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Text(
                '#8565 12',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(136, 0, 0, 0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.42,
              right: MediaQuery.of(context).size.width * 0.04 + 40,
              child: Text(
                'Money Transfer',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(136, 0, 0, 0)),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.49,
              left: MediaQuery.of(context).size.width * 0.04 + 50,
              child: Text(
                'Account Holder Name',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.49,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Icon(Icons.person_2_outlined),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.52,
              left: MediaQuery.of(context).size.width * 0.04 + 50,
              child: Text(
                widget.a,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(136, 0, 0, 0),
                    fontStyle: FontStyle.italic),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.58,
              left: MediaQuery.of(context).size.width * 0.04 + 50,
              child: Text(
                'Sent To',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.58,
              left: MediaQuery.of(context).size.width * 0.04 + 20,
              child: Icon(Icons.account_balance),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.608,
              left: MediaQuery.of(context).size.width * 0.04 + 50,
              child: Text(
                widget.b,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(136, 0, 0, 0),
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
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
                String a = widget.a;
                String b = widget.b;
                String c = widget.c;
                double d = widget.d;
                print(a);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Verify(a: a, b: b, c: c, d: d, e: true),
                  ),
                );
              },
              child: Text(
                'Next',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                textStyle: const TextStyle(
                    color: Colors.white,
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
