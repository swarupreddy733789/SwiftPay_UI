import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({super.key});

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Kiran  Chaitu",
                      style: TextStyle(
                        color: Color(0xFFFFFEF9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 15,
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 50,
                    child: Text(
                      "AC. 9183 4389 0944",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 95,
                    left: 15,
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 98,
                    left: 50,
                    child: Text(
                      "State Bank of India",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 50,
                    child: Text(
                      "Mandapeta Branch",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 50,
                    child: Text(
                      "Konaseema District",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 60,
                      width: 56,
                      color: Color(0xFFFFFEF9),
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(left: 10, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF161616),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.add_to_drive_rounded,
                          color: Color(0xFFFFFEF9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Kiran Chaitu",
                      style: TextStyle(
                        color: Color(0xFFFFFEF9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 15,
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 50,
                    child: Text(
                      "AC. 2395 0595 4938",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 95,
                    left: 15,
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 98,
                    left: 50,
                    child: Text(
                      "Canada Bank",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 50,
                    child: Text(
                      "Orchard Branch",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 50,
                    child: Text(
                      "Riverside District",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 60,
                      width: 56,
                      color: Color(0xFFFFFEF9),
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF161616),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.add_to_drive_rounded,
                          color: Color(0xFFFFFEF9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Kiran Chaitu",
                      style: TextStyle(
                        color: Color(0xFFFFFEF9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 15,
                    child: Icon(
                      Icons.person_outline,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 60,
                    left: 50,
                    child: Text(
                      "AC. 7698 0934 2347",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 95,
                    left: 15,
                    child: Icon(
                      Icons.account_balance,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 98,
                    left: 50,
                    child: Text(
                      "Baroda Bank",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 50,
                    child: Text(
                      "Sunset Boulevard Branch",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 15,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xFFFFFEF9),
                    ),
                  ),
                  const Positioned(
                    top: 170,
                    left: 50,
                    child: Text(
                      "Downtown District",
                      style: TextStyle(
                        color: Color(0xFF8A8A8A),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 60,
                      width: 56,
                      color: Color(0xFFFFFEF9),
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF161616),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          Icons.add_to_drive_rounded,
                          color: Color(0xFFFFFEF9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          options: CarouselOptions(
            height: 220.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        SizedBox(
          height: 70,
        ),
        SizedBox(
          child: Center(
            child: Container(
              height: 80,
              width: 170,
              decoration: const BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: InkWell(
                  onTap: () => {},
                  child: Center(
                    child: Text(
                      "Add Bank Account +",
                      style: TextStyle(
                        color: Color(0xFFFFFEF9),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
