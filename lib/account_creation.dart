import 'package:flutter/material.dart';
import 'package:SwiftPay/glass_morphism.dart';
import 'package:SwiftPay/home_screen.dart';

List<IconData> icons = [
  Icons.person_outline,
  Icons.mail_outline,
  Icons.call_outlined,
  Icons.lock_outline
];
List<String> details = ["Username", "Email", "Phone Number", "Password"];

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();

  getDetails(List<String> placeHolders, List<IconData> icons) {}
}

class _CreateAccountState extends State<CreateAccount> {
  bool visible = false;

  List<Widget> getDetails(List<String> li, List<IconData> icons) {
    List<Widget> list = [];
    for (int i = 0; i < li.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GlassMorphism(
          blur: 20,
          opacity: 0.4,
          height: 65,
          width: MediaQuery.of(context).size.width - 50,
          borderRadius: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  icons[i],
                  size: 33,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: li[i] == "Email"
                        ? TextInputType.emailAddress
                        : li[i] == "Phone Number"
                            ? TextInputType.number
                            : null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: li[i],
                      suffixIcon: li[i] == "Password"
                          ? IconButton(
                              icon: Icon(visible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            )
                          : null,
                    ),
                    obscureText:
                        (li[i] == "Password" && visible) ? true : false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return list;
  }

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
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                'Transfers money globally, manages all your',
                style: TextStyle(color: Color(0xFF8A8A8A)),
              ),
              Text('banks, and pay bills within one app.',
                  style: TextStyle(color: Color(0xFF8A8A8A))),
              SizedBox(
                height: 50,
              ),
              ...getDetails(details, icons),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  width: 230,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF161616)),
                  child: const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By Signing up in the app I will accept the ',
                    style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 12),
                  ),
                  Text(
                    'Terms of Use',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'and ',
                    style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 12),
                  ),
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
