import 'package:contact_list/models/contact.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

class DummyContacts {
  static Future<List<LocalContact>> create() async {
    List<LocalContact> dummyContacts = [
      await _createContact(
        displayName: 'Petro Petrenko',
        avatarPath: 'assets/images/petrenko.png',
        phones: [
          ContactItem(label: 'Mobile', value: '1234567890'),
          ContactItem(label: 'Work', value: '9876543210'),
        ],
      ),
      await _createContact(
        displayName: 'Olena Smotrych',
        avatarPath: 'assets/images/smotrych.png',
        phones: [
          ContactItem(label: 'Home', value: '5555555555'),
        ],
      ),
      await _createContact(
        displayName: 'Oleh Shevchenko',
        avatarPath: 'assets/images/shevchenko.png',
        phones: [
          ContactItem(label: 'Home', value: '2234567890'),
        ],
      ),
    ];

    return dummyContacts;
  }

  static Future<LocalContact> _createContact({
    required String displayName,
    required String avatarPath,
    required List<ContactItem> phones,
  }) async {
    ByteData? byteData;
    try {
      byteData = await rootBundle.load(avatarPath);
    } catch (e) {
      print('Error loading image file: $e');
    }

    Uint8List? avatarBytes = byteData?.buffer.asUint8List();

    return LocalContact(
      displayName: displayName,
      avatar: avatarBytes,
      phones: phones,
    );
  }
}
