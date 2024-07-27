import 'dart:typed_data';
import 'package:SwiftPay/quick_send_money.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:SwiftPay/plan.dart';

class ContactsPage extends StatefulWidget {
  final bool recharge;
  ContactsPage({super.key, required this.recharge});
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    try {
      if (await Permission.contacts.request().isGranted) {
        Iterable<Contact> contacts = await ContactsService.getContacts();
        setState(() {
          _contacts = contacts;
          _filteredContacts =
              contacts.isNotEmpty ? contacts.toList() : _defaultContacts();
        });
      } else {
        print('Contacts permission denied');
        setState(() {
          _filteredContacts = _defaultContacts();
        });
      }
    } catch (e) {
      print('Error fetching contacts: $e');
      setState(() {
        _filteredContacts = _defaultContacts();
      });
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredContacts = _contacts.where((contact) {
        final name = contact.displayName?.toLowerCase() ?? '';
        final phoneNumbers =
            contact.phones?.map((phone) => phone.value?.toLowerCase() ?? '') ??
                [];
        return name.contains(_searchQuery) ||
            phoneNumbers.any((phone) => phone.contains(_searchQuery));
      }).toList();
    });
  }

  Color _colorFromName(String name) {
    int hash = name.codeUnits.fold(0, (prev, curr) => prev + curr);
    return Color((hash & 0xFFFFFF) + 0xFF000000).withOpacity(1.0);
  }

  Widget _buildContactAvatar(Contact contact) {
    String displayName = contact.displayName ?? 'No Name';
    if (contact.avatar != null && contact.avatar!.isNotEmpty) {
      return CircleAvatar(
        backgroundImage: MemoryImage(Uint8List.fromList(contact.avatar!)),
        radius: 24,
      );
    } else {
      return CircleAvatar(
        backgroundColor: _colorFromName(displayName),
        child: Text(
          contact.initials().length <= 1
              ? (contact.displayName.toString()[0] == '+'
                  ? contact.displayName.toString()[1]
                  : contact.displayName.toString()[0])
              : contact.initials(),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        radius: 24,
      );
    }
  }

  List<Contact> _defaultContacts() {
    return [
      Contact(
        displayName: 'My Number',
        phones: [Item(value: '+919912514884')],
        avatar: null,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Contact defaultContact = _defaultContacts().first;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 15, top: 10, bottom: 5),
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
        backgroundColor: Colors.white,
        title: Text('Contacts'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or phone number',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: _filterContacts,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              String a = defaultContact.displayName ?? 'No Name';
              String b = defaultContact.phones!.isNotEmpty
                  ? defaultContact.phones!.first.value ?? 'No Phone'
                  : 'No Phone';
              widget.recharge == true
                  ? (Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPlan(a: a, b: b),
                      ),
                    ))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuickSendMoney(name: a, account: b)));
            },
            child: ListTile(
              tileColor: Colors.white,
              leading: _buildContactAvatar(defaultContact),
              title: Text(defaultContact.displayName ?? 'No Name'),
              subtitle: Text(defaultContact.phones!.isNotEmpty
                  ? defaultContact.phones!.first.value ?? 'No Phone'
                  : 'No Phone'),
            ),
          ),
          Divider(),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              child: Text('Contacts'),
            ),
          ),
          Flexible(
            child: _filteredContacts.isNotEmpty
                ? ListView.separated(
                    itemCount: _filteredContacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = _filteredContacts[index];
                      return GestureDetector(
                        onTap: () {
                          String a = contact.displayName ?? 'No Name';
                          String b = contact.phones!.isNotEmpty
                              ? contact.phones!.first.value ?? 'No Phone'
                              : 'No Phone';
                          widget.recharge == true
                              ? (Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyPlan(a: a, b: b),
                                  ),
                                ))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          QuickSendMoney(name: a, account: b)));
                        },
                        child: ListTile(
                          tileColor: Colors.white,
                          leading: _buildContactAvatar(contact),
                          title: Text(contact.displayName ?? 'No Name'),
                          subtitle: Text(contact.phones!.isNotEmpty
                              ? contact.phones!.first.value ?? 'No Phone'
                              : 'No Phone'),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(),
                    ),
                  )
                : Center(child: Text('No contacts found')),
          ),
        ],
      ),
    );
  }
}
