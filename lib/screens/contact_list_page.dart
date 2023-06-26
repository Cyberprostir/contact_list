import 'package:flutter/material.dart';
import 'package:contact_list/screens/contact_detail_screen.dart';
import 'package:contact_list/screens/permissions_screen.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/services/contact_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contact_list/services/dummy_contacts.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<LocalContact>? contacts;

  @override
  void initState() {
    super.initState();
    _getContacts();
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<LocalContact> fetchedContacts = await DummyContacts.create();
      setState(() {
        contacts = fetchedContacts;
      });
    } else if (await Permission.contacts.isPermanentlyDenied) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PermissionsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: contacts != null && contacts!.isNotEmpty
          ? ListView.builder(
              itemCount: contacts!.length,
              itemBuilder: (context, index) {
                final contact = contacts![index];
                final phone = contact.phones?.isNotEmpty == true
                    ? contact.phones!.first.value ?? ''
                    : '';
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(phone),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetailScreen(
                          contact: contact,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
