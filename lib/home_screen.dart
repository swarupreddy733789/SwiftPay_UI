import 'package:flutter/material.dart';
import 'package:SwiftPay/profile.dart';
import 'package:SwiftPay/sample.dart';
import 'package:SwiftPay/home_page.dart';
import 'package:SwiftPay/wallet.dart';
import 'package:animations/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget selectedBody(int selectedIndex, ValueNotifier<int> selectedIndexNotifier) {
  switch (selectedIndex) {
    case 0:
      return HomePage(selectedIndexNotifier: selectedIndexNotifier);
    case 1:
      return MyWallet();
    case 2:
      return Stats();
    case 3:
      return Profile();
    default:
      return Center(child: Text('Hi'));
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    selectedIndexNotifier.addListener(_updateIndex);
  }

  @override
  void dispose() {
    selectedIndexNotifier.removeListener(_updateIndex);
    super.dispose();
  }

  void _updateIndex() {
    setState(() {
      selectedIndex = selectedIndexNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: selectedIndex < selectedIndexNotifier.value,
        transitionBuilder: (Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: selectedBody(selectedIndex, selectedIndexNotifier),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            backgroundColor: const Color(0xFF161616),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
              BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: "Stats"),
              BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Profile"),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: const Color(0xFFFFCA3A),
            unselectedItemColor: const Color(0xFF5F5F5F),
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
                selectedIndexNotifier.value = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
