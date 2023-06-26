import 'package:flutter/material.dart';
import 'package:contact_list/models/contact.dart';
import 'dart:typed_data'; 

class ContactDetailScreen extends StatelessWidget {
  final LocalContact contact;

  ContactDetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: MemoryImage(contact.avatar ?? Uint8List(0)),
              radius: 50,
            ),
            SizedBox(height: 16),
            Text('Name: ${contact.displayName ?? ''}'),
            SizedBox(height: 8),
            Text(
              'Phone: ${contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : ''}',
            ),
          ],
        ),
      ),
    );
  }
}
