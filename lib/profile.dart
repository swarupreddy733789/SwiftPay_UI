import 'package:SwiftPay/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SwiftPay/main.dart';
import 'package:SwiftPay/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  double h = 0, w = 0;
  String dropDown = 'en';
  var menu = ['en', 'es', 'zs', 'hi', 'ar', 'pt', 'bn', 'ru', 'ja', 'de'];
  bool _isSwitched = false;
  void _toogleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _loadImage();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  Future<void> _loadImage() async {
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFFFFFEF9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: Colors.black.withOpacity(0.1))
              ],
            ),
            child: IconButton(
              icon: Icon(Icons.logout_outlined),
              iconSize: 30,
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ClipOval(
                  child: Image.asset(
                    'assets/emma_watson.jpg', // Your profile picture URL
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.account_circle,
                        size: 150,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "EMMA WATSON",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Center(
              child: Text(
                "+85 9040287898",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                color: Color(0x0F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.person_outline,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Account Info",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                color: Color(0x0F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.language_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 0.4 * w,
                  ),
                  DropdownButton(
                    value: dropDown,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: menu.map((String menu) {
                      return DropdownMenuItem(
                        value: menu,
                        child: Text(menu),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDown = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                color: Color(0x0F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Payment Alert",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: _isSwitched,
                    onChanged: _toogleSwitch,
                    activeColor: Color(0xFF161616),
                    inactiveThumbColor: Color(0xFF8A8A8A),
                    inactiveTrackColor: Color(0x2F8A8A8A),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                color: Color(0x0F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.settings_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "General Settings",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              width: w,
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                color: Color(0x0F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword())),
                },
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.lock_open_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
