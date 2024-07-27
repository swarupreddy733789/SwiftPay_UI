import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/glassmorphism.dart';
import 'package:SwiftPay/pin.dart';

class MyPhoneMoney extends StatefulWidget {
  const MyPhoneMoney({super.key});

  @override
  State<MyPhoneMoney> createState() => _MyPhoneMoneyState();
}

class _MyPhoneMoneyState extends State<MyPhoneMoney> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  String collectedData = '0';
  Color borderColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Transfer'),
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
        child: Center(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.posb.com.sg/iwov-resources/media/images/articles/4-reasons-why-you-should-use-dbs-remit/Secured-Transactions.gif'),
                      fit: BoxFit.fill),
                ),
              ),
              GlassMorphism(
                blur: 0,
                opacity: 0.5,
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                child: TextField(
                  controller: _controller3,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                    icon: Icon(Icons.contact_mail),
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
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                    icon: Icon(Icons.phone_iphone_outlined),
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
                    hintText: 'Enter the Amount',
                    //labelStyle: TextStyle(color: Color.fromARGB(165, 81, 78, 78)),
                    icon: Icon(Icons.account_balance_wallet),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.height * 0.1,
          right: MediaQuery.of(context).size.height * 0.1,
          bottom: MediaQuery.of(context).size.height * 0.18,
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
                String a = _controller3.text;
                String b = _controller1.text;
                String c = '';
                double d = double.parse(_controller2.text);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Verify(a: a, b: b, c: c, d: d,e:false),
                  ),
                );
              },
              child: Text(
                'Send ',
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
