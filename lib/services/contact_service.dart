import 'package:contacts_service/contacts_service.dart';
import 'package:contact_list/models/contact.dart';

class ContactService {
  static Future<List<LocalContact>> getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    List<LocalContact> localContacts = contacts
        .map((contact) => LocalContact(
              displayName: contact.displayName,
              avatar: contact.avatar,
              phones: contact.phones != null
                  ? contact.phones!
                      .map((phone) => ContactItem(
                            label: phone.label ?? '',
                            value: phone.value ?? '',
                          ))
                      .toList()
                  : null,
            ))
        .toList();
    return localContacts;
  }
}
