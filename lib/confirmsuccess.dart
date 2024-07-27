import 'package:flutter/material.dart';

class Transferconfirm1 extends StatefulWidget {
  final String a, b, c;
  final double d;
  final bool e;
  const Transferconfirm1(
      {super.key,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.e});

  @override
  State<Transferconfirm1> createState() => _Transferconfirm1State();
}

class _Transferconfirm1State extends State<Transferconfirm1> {
  final date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            //color: Colors.black,
          ),
          Positioned(
            top: 20,
            left: MediaQuery.of(context).size.width * 0.5 - 60,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Color.fromARGB(107, 242, 201, 89),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                      color: Color.fromARGB(162, 232, 195, 93), width: 1.5)),
            ),
          ),
          Positioned(
            top: 35,
            left: MediaQuery.of(context).size.width * 0.5 - 45,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 196, 52),
                borderRadius: BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                    color: Color.fromARGB(255, 242, 199, 81), width: 2),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width * 0.5 - 30,
            child: Icon(
              Icons.done_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.5 - 130,
            right: MediaQuery.of(context).size.width * 0.5 - 130,
            child: Text(
              'Money Transfer Was',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF161616)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.5 - 80,
            right: MediaQuery.of(context).size.width * 0.5 - 80,
            child: Text(
              'Successfull',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF161616)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.5 - 120,
            right: MediaQuery.of(context).size.width * 0.5 - 120,
            child: Text(
              'Below are the information summary',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(154, 22, 22, 22)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(37, 138, 138, 138),
                border: Border.all(
                  color: Color.fromARGB(23, 0, 0, 0),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.47,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(37, 138, 138, 138),
                border: Border(
                  left: BorderSide(
                    color: Color.fromARGB(23, 0, 0, 0),
                  ),
                  right: BorderSide(
                    color: Color.fromARGB(23, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.59,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(37, 138, 138, 138),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                border: Border.all(
                  color: Color.fromARGB(23, 0, 0, 0),
                ),
              ),
            ),
          ),
          lefts('Transaction ID', 0.37, 140, Colors.black, 17),
          rights('Account Number', 0.37, 140, Colors.black, 17),
          lefts('1489 4586 2574', 0.41, 140, Color.fromARGB(126, 0, 0, 0), 15),
          rights(widget.b, 0.41, widget.b.length + 110,
              Color.fromARGB(126, 0, 0, 0), 15),
          lefts('Sent to', 0.48, 140, Colors.black, 17),
          lefts(widget.b + " ( " + widget.a + " )", 0.52, 140,
              Color.fromARGB(126, 0, 0, 0), 17),
          lefts('Date', 0.6, 140, Colors.black, 17),
          rights('Time', 0.6, 70, Colors.black, 17),
          lefts(date.toString().substring(0, 10), 0.64, 140,
              const Color.fromARGB(126, 0, 0, 0), 17),
          rights(date.toString().substring(10, 19), 0.64, 100,
              const Color.fromARGB(126, 0, 0, 0), 17),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.17,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.04,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black),
            child: Center(
              child: Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.63,
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.04,
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
                    Navigator.pop(context);
                    Navigator.pop(context);

                    widget.e == true ? (Navigator.pop(context)) : null;
                    widget.e == true ? (Navigator.pop(context)) : null;

                    widget.e == true ? (Navigator.pop(context)) : null;
                  },
                  child: Text(
                    'Home',
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
        ],
      ),
    );
  }

  Widget lefts(String a, double b, double c, Color d, double e) {
    return Positioned(
      top: MediaQuery.of(context).size.height * b,
      left: MediaQuery.of(context).size.width * 0.5 - c,
      child: Text(
        a,
        style: TextStyle(fontSize: e, fontWeight: FontWeight.bold, color: d),
      ),
    );
  }

  Widget rights(String a, double b, double c, Color d, double e) {
    return Positioned(
      top: MediaQuery.of(context).size.height * b,
      right: MediaQuery.of(context).size.width * 0.5 - c,
      child: Text(
        a,
        style: TextStyle(fontSize: e, fontWeight: FontWeight.bold, color: d),
      ),
    );
  }
}
