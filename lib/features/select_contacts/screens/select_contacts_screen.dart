import 'package:whatsapp_clone/barrel/export.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactsScreen({super.key});

  void selectContact(
      BuildContext context, WidgetRef ref, Contact selectedContact) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(context, selectedContact);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contact'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tabColor,
                    child: Icon(
                      Icons.people,
                      color: textColor,
                    ),
                  ),
                  title: Text('New Group'),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tabColor,
                    child: Icon(
                      Icons.person_add,
                      color: textColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.qr_code,
                    color: greyColor,
                  ),
                  title: Text('New Contact'),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tabColor,
                    child: Icon(
                      Icons.groups,
                      color: textColor,
                    ),
                  ),
                  title: Text('New Community'),
                ),
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: EdgeInsets.only(left: size.width*0.05),
                  child: const Text(
                    'Contacts on my Whatsapp clone',
                    style: TextStyle(color: greyColor),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
          ref.watch(getContactsProvider).when(
                data: (contactList) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final contact = contactList[index];
                        return InkWell(
                          onTap: () => selectContact(context, ref, contact),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(
                                contact.displayName,
                                style: const TextStyle(fontSize: 18),
                              ),
                              leading: contact.photo == null
                                  ? CircleAvatar(
                                      backgroundImage: NetworkImage(photoUrl),
                                      radius: 30,
                                    )
                                  : CircleAvatar(
                                      backgroundImage:
                                          MemoryImage(contact.photo!),
                                      radius: 30,
                                    ),
                            ),
                          ),
                        );
                      },
                      childCount: contactList.length,
                    ),
                  );
                },
                error: (error, trace) {
                  return SliverToBoxAdapter(
                    child: ErrorScreen(
                      error: error.toString(),
                    ),
                  );
                },
                loading: () => const SliverToBoxAdapter(
                  child: Loader(),
                ),
              ),
        ],
      ),
    );
  }
}
