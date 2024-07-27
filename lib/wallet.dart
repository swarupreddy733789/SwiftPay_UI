import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:SwiftPay/glassmorphism.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Map<String, String>> cards = [
  {
    'imagePath': 'assets/fcard2.jpg',
    'cardNumber': '1234 5678 9012 3456',
    'cardHolder': 'John Doe',
    'expiryDate': '12/25',
  },
];

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "My Wallet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 7),
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color(0x2F8A8A8A),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.add),
                color: const Color(0xFF161616),
                iconSize: 30,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              labelColor: Color(0xFFFFFEF9),
              unselectedLabelColor: Color(0xFF161616),
              tabs: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Cards",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Bank Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CardsTab(),
                  BankAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _cardHolder = '';
  String _expiryMonth = '01';
  String _expiryYear = '2025';

  final List<String> _months =
      List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
  final List<String> _years =
      List.generate(10, (index) => (DateTime.now().year + index).toString());

  void _showAddCardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Add New Card',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GlassMorphism(
                        blur: 0,
                        opacity: 0.5,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 10,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter the Card Number',
                            icon: Icon(Icons.account_balance_wallet),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberInputFormatter(),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a card number';
                            } else if (value.replaceAll(' ', '').length != 16) {
                              return 'Card number must be 16 digits';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _cardNumber = value!;
                          },
                        ),
                      ),
                      GlassMorphism(
                        blur: 0,
                        opacity: 0.5,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        borderRadius: 10,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter the Card Holder',
                            icon: Icon(Icons.account_balance_wallet),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a card holder name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _cardHolder = value!;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          GlassMorphism(
                            blur: 0,
                            opacity: 0.5,
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.25,
                            borderRadius: 10,
                            child: DropdownButtonFormField<String>(
                              value: _expiryMonth,
                              decoration: InputDecoration(
                                hintText: 'Enter the Amount',
                                border: InputBorder.none,
                              ),
                              items: _months.map((month) {
                                return DropdownMenuItem<String>(
                                  value: month,
                                  child: Text(month),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _expiryMonth = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a month';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 25),
                          GlassMorphism(
                            blur: 0,
                            opacity: 0.5,
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.25,
                            borderRadius: 10,
                            child: DropdownButtonFormField<String>(
                              value: _expiryYear,
                              decoration: InputDecoration(
                                hintText: 'Enter the Amount',
                                border: InputBorder.none,
                              ),
                              items: _years.map((year) {
                                return DropdownMenuItem<String>(
                                  value: year,
                                  child: Text(year),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _expiryYear = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a year';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            cards.add({
                              'imagePath': 'assets/fcard2.jpg',
                              'cardNumber': _cardNumber,
                              'cardHolder': _cardHolder,
                              'expiryDate': '$_expiryMonth/$_expiryYear',
                            });
                          });
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: Column(
            children: [
              ...cards.map((card) => buildCard(context, card)).toList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => _showAddCardDialog(),
        child: Container(
          height: 60,
          width: 200,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Text(
              'Add Card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildCard(BuildContext context, Map<String, String> card) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 10, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(card['imagePath']!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 35,
              left: 25,
              child: Text(
                card['cardNumber']!,
                style: const TextStyle(
                  color: Color(0xFFFFFEF9),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: Text(
                card['cardHolder']!,
                style: const TextStyle(
                  color: Color(0xFFFFFEF9),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: Text(
                card['expiryDate']!,
                style: const TextStyle(
                  color: Color(0xFFFFFEF9),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class BankAccount extends StatefulWidget {
  const BankAccount({super.key});

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  List<Map<String, String>> bankAccounts = [
    {
      "name": "Kiran Chaitu",
      "accountNumber": "AC. 9183 4389 0944",
      "bankName": "State Bank of India",
      "branch": "Mandapeta Branch",
      "district": "Konaseema District",
    },
    {
      "name": "Swarup Reddy",
      "accountNumber": "AC. 2395 0595 0536",
      "bankName": "Canada Bank",
      "branch": "Orchard Branch",
      "district": "Riverside District",
    },
    {
      "name": "Reddi Deekshith",
      "accountNumber": "AC. 7698 0934 2347",
      "bankName": "Baroda Bank",
      "branch": "Sunset Boulevard Branch",
      "district": "Downtown District",
    },
  ];

  void _showAddBankAccountDialog() {
    String name = "";
    String accountNumber = "";
    String bankName = "";
    String branch = "";
    String district = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Bank Account'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                GlassMorphism(
                  blur: 0,
                  opacity: 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                GlassMorphism(
                  blur: 0,
                  opacity: 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Account Number',
                      icon: Icon(FontAwesomeIcons.userCircle),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      accountNumber = value;
                    },
                  ),
                ),
                GlassMorphism(
                  blur: 0,
                  opacity: 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bank Name',
                      icon: Icon(FontAwesomeIcons.bank),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      bankName = value;
                    },
                  ),
                ),
                GlassMorphism(
                  blur: 0,
                  opacity: 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Branch',
                      icon: Icon(FontAwesomeIcons.building),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      branch = value;
                    },
                  ),
                ),
                GlassMorphism(
                  blur: 0,
                  opacity: 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.8,
                  borderRadius: 10,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'District',
                      icon: Icon(FontAwesomeIcons.mapMarkedAlt),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      district = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  bankAccounts.add({
                    "name": name,
                    "accountNumber": accountNumber,
                    "bankName": bankName,
                    "branch": branch,
                    "district": district,
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        CarouselSlider(
          items: bankAccounts.map((account) {
            return Container(
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Color(0xFF161616),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                border: Border.all(color: Colors.white, width: 0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      account["name"]!,
                      style: const TextStyle(
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
                  Positioned(
                    top: 60,
                    left: 50,
                    child: Text(
                      account["accountNumber"]!,
                      style: const TextStyle(
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
                  Positioned(
                    top: 98,
                    left: 50,
                    child: Text(
                      account["bankName"]!,
                      style: const TextStyle(
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
                  Positioned(
                    top: 135,
                    left: 50,
                    child: Text(
                      account["branch"]!,
                      style: const TextStyle(
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
                  Positioned(
                    top: 170,
                    left: 50,
                    child: Text(
                      account["district"]!,
                      style: const TextStyle(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(10)),
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 10, bottom: 10),
                        decoration: BoxDecoration(
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
            );
          }).toList(),
          options: CarouselOptions(
            height: 220.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        const SizedBox(height: 70),
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
                onTap: _showAddBankAccountDialog,
                child: const Center(
                  child: Text(
                    "Add Bank Account +",
                    style: TextStyle(
                      color: Color(0xFFFFFEF9),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
