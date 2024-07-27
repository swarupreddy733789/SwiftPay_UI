import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final String a;
  final double b;

  const PaymentSuccessScreen({
    super.key,
    required this.a,
    required this.b,
  });

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  final date = DateTime.now();
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
            color: Colors.white,
          ),
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
            top: 50,
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
            top: 65,
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
            top: 80,
            left: MediaQuery.of(context).size.width * 0.5 - 30,
            child: Icon(
              Icons.done_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.22,
            left: MediaQuery.of(context).size.width * 0.44 - 135,
            right: MediaQuery.of(context).size.width * 0.5 - 160,
            child: Text(
              'Your ${widget.a}  Payment request',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF161616)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            left: MediaQuery.of(context).size.width * 0.4 - 55,
            right: MediaQuery.of(context).size.width * 0.4 - 110,
            child: Text(
              "of " + widget.b.toString() + ' is Successfull',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF161616)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: MediaQuery.of(context).size.width * 0.55 - 120,
            right: MediaQuery.of(context).size.width * 0.3 - 120,
            child: Text(
              'Your Payment has been processed',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(154, 22, 22, 22)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.36,
            left: MediaQuery.of(context).size.width * 0.46 - 53,
            right: MediaQuery.of(context).size.width * 0.3 - 53,
            child: Text(
              "Sucessfully by" + date.toString().substring(10, 16) + " today",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(154, 22, 22, 22)),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.41,
            left: MediaQuery.of(context).size.width * 0.5 - 75,
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 196, 52),
                borderRadius: BorderRadius.all(Radius.circular(100)),
                border: Border.all(
                    color: Color.fromARGB(255, 242, 199, 81), width: 2),
              ),
              child: Center(
                child: Text(
                  'View details',
                  style: TextStyle(
                      color: Color.fromARGB(174, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0,
            right: MediaQuery.of(context).size.height * 0,
            bottom: MediaQuery.of(context).size.height * 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            color: Color.fromARGB(255, 242, 199, 89),
          ),
          child: Center(
            child: Text(
              'DONE',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
