import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage1 extends StatefulWidget {
  @override
  _ContactsPage1State createState() => _ContactsPage1State();
}

class _ContactsPage1State extends State<ContactsPage1> {
  Iterable<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  String _searchQuery = '';
  Map<String, bool> _invitedContacts = {}; 

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

  void _sendInvitation(Contact contact, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Invitation Sent"),
          content: Text("Invitation sent to ${contact.displayName}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _invitedContacts[contact.displayName ?? ''] = true;
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInviteButton(Contact contact, int index) {
    return GestureDetector(
      onTap: () => _sendInvitation(contact, index),
      child: Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Color.fromARGB(110, 0, 0, 0)),
        ),
        child: Center(
          child: Text(
            'Invite',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildInvitedButton() {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(color: Color.fromARGB(110, 0, 0, 0)),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Refer To',
          style: TextStyle(fontSize: 20),
        ),
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
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Flexible(
            child: _filteredContacts.isNotEmpty
                ? ListView.separated(
                    itemCount: _filteredContacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = _filteredContacts[index];
                      bool isInvited =
                          _invitedContacts[contact.displayName ?? ''] ?? false;
                      return ListTile(
                        tileColor: Colors.white,
                        leading: _buildContactAvatar(contact),
                        title: Text(contact.displayName ?? 'No Name'),
                        subtitle: Text(contact.phones!.isNotEmpty
                            ? contact.phones!.first.value ?? 'No Phone'
                            : 'No Phone'),
                        trailing: isInvited
                            ? _buildInvitedButton()
                            : _buildInviteButton(contact, index),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                  )
                : Center(
                    child: Text('No contacts found'),
                  ),
          ),
        ],
      ),
    );
  }
}
