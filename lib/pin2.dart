import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/glassmorphism.dart';
import 'package:SwiftPay/loading.dart';
import 'package:SwiftPay/rechargesuccess.dart';

class Verify extends StatefulWidget {
  final String a, b, c;
  final double d;
  const Verify(
      {super.key,
      required this.a,
      required this.b,
      required this.c,
      required this.d});

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  //final FocusNode _focusNode5 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    //_focusNode5.dispose();
    super.dispose();
  }

  List<Widget> codeContainers() {
    return [
      _buildSingleDigitTextField(_focusNode1, _focusNode2),
      _buildSingleDigitTextField(_focusNode2, _focusNode3),
      _buildSingleDigitTextField(_focusNode3, _focusNode4),
      _buildSingleDigitTextField(_focusNode4, null),
      //_buildSingleDigitTextField(_focusNode5, null),
    ];
  }

  Widget _buildSingleDigitTextField(
      FocusNode currentNode, FocusNode? nextNode) {
    return GlassMorphism(
      blur: 0,
      opacity: 0.6,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.14,
      borderRadius: 5,
      child: Center(
        child: TextField(
          focusNode: currentNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.length == 1) {
              if (nextNode != null) {
                FocusScope.of(context).requestFocus(nextNode);
              } else {
                currentNode.unfocus();
              }
            }
          },
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage('assets/secure.jpg'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(height: 30),
              Text(
                'Enter PIN To Confirm',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                'Please enter your 4 digit PIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 45),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: codeContainers(),
                ),
              ),
              SizedBox(height: 50),
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
          bottom: MediaQuery.of(context).size.height * 0.27,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                String a = widget.a;
                String b = widget.b;
                String c = widget.c;
                double d = widget.d;
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => LoadingScreen(),
                );
                await Future.delayed(Duration(seconds: 3));
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Rechargesuccess(a: a, b: b, c: c, d: d),
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
