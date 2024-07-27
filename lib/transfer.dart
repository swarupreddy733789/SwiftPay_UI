import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/glassmorphism.dart';
import 'package:SwiftPay/transferconfirm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Transfer extends StatefulWidget {
  final String s;
  final double d;
  const Transfer({super.key, required this.d, required this.s});
  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xFF161616),
                    border: Border.all(color: Color(0xFFFFFEF9)),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/free-vector/dark-black-background-design-with-stripes_1017-38064.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1721606400&semt=ais_user'),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  child: Text(
                    widget.s,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    '\$' + widget.d.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 30,
                  child: Icon(
                    FontAwesomeIcons.addressCard,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: Text(
                    'Swift Pay',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 25,
                  left: 25,
                  child: SizedBox(
                    height: 40,
                    width: 60,
                    child: Image(image: AssetImage('assets/1.png')),
                  ),
                ),
              ],
            ),
            GlassMorphism(
              blur: 0,
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              borderRadius: 10,
              child: TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  hintText: 'Enter the Name',
                  //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                  icon: Icon(Icons.person),
                  border: InputBorder.none,
                ),
              ),
            ),
            GlassMorphism(
              blur: 0,
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              borderRadius: 10,
              child: TextField(
                controller: _controller2,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: 'Enter the AccountNumber',
                  //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                  icon: Icon(Icons.account_balance),
                  border: InputBorder.none,
                ),
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
                String a = _controller1.text;
                String b = _controller2.text;
                String c = widget.s;
                double d = widget.d;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Transferconfirm(a: a, b: b, c: c, d: d),
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
