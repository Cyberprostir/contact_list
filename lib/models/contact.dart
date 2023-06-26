import 'dart:typed_data';

class LocalContact {
  final String? displayName;
  final Uint8List? avatar;
  final List<ContactItem>? phones;

  LocalContact({this.displayName, this.avatar, this.phones});
}

class ContactItem {
  final String? label;
  final String? value;

  ContactItem({this.label, this.value});
}

