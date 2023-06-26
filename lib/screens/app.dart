import 'package:flutter/material.dart';
import 'package:contact_list/screens/contact_list_page.dart';

class ContactListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      home: ContactListPage(),
    );
  }
}
