import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SwiftPay/sign_in_page.dart';
import 'glass_morphism.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              SizedBox(height: 75),
              Text(
                'Forgot Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              SizedBox(height: 40),
              Text(
                'Enter the Email address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'associated with your account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'We will email you a link to reset',
                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
              ),
              Text(
                'Your Password',
                style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 16),
              ),
              SizedBox(height: 45),
              GlassMorphism(
                blur: 20,
                opacity: 0.3,
                height: 65,
                width: MediaQuery.of(context).size.width - 50,
                borderRadius: 5,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 33,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Verify()));
                },
                child: Container(
                  width: 190,
                  height: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF161616)),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    super.dispose();
  }

  List<Widget> codeContainers() {
    return [
      _buildSingleDigitTextField(_focusNode1, _focusNode2),
      _buildSingleDigitTextField(_focusNode2, _focusNode3),
      _buildSingleDigitTextField(_focusNode3, _focusNode4),
      _buildSingleDigitTextField(_focusNode4, _focusNode5),
      _buildSingleDigitTextField(_focusNode5, null),
    ];
  }

  Widget _buildSingleDigitTextField(
      FocusNode currentNode, FocusNode? nextNode) {
    return GlassMorphism(
      blur: 0,
      opacity: 0.3,
      height: 60,
      width: 60,
      borderRadius: 5,
      child: Center(
        child: TextField(
          focusNode: currentNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
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
              SizedBox(height: 70),
              Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              SizedBox(height: 30),
              Text(
                'Enter the verification code we',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'just sent you on your email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Adress',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: codeContainers(),
                ),
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPassword()));
                },
                child: Container(
                  width: 190,
                  height: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF161616)),
                  child: Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool visible = false;
  bool visible2 = false;
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
              SizedBox(
                height: 65,
              ),
              Text(
                'Create New Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Your new password must be different',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'from previous used passwords.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              GlassMorphism(
                  blur: 0,
                  opacity: 0.3,
                  height: 68,
                  width: MediaQuery.of(context).size.width - 60,
                  borderRadius: 20,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: TextField(
                          obscureText: visible ? true : false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'New Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                icon: Icon(visible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ))
                      ],
                    ),
                  )),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  'Must be atleast 8 characters',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GlassMorphism(
                  blur: 0,
                  opacity: 0.3,
                  height: 68,
                  width: MediaQuery.of(context).size.width - 60,
                  borderRadius: 20,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: TextField(
                          obscureText: visible2 ? true : false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Confirm Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible2 = !visible2;
                                  });
                                },
                                icon: Icon(visible2
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ))
                      ],
                    ),
                  )),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 50),
                child: Text(
                  'Both Passwords Must Match',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Container(
                  width: 210,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF161616)),
                  child: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
