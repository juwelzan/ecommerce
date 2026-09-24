import 'package:ecommerce/shared/path/paths.dart';

class AddressScreen extends StatelessWidget {
  static const String name = '/AddressScreen';
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.savedAddresses)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: context.theme.primaryColor.withValues(
                  alpha: 0.1,
                ),
                child: Icon(
                  Icons.home_outlined,
                  color: context.theme.primaryColor,
                ),
              ),
              title: Text(context.l10n.homeAddress),
              subtitle: Text(context.l10n.homeAddressValue),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ),
          Gap(h: 12.h),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.work_outline)),
              title: Text(context.l10n.workAddress),
              subtitle: Text(context.l10n.workAddressValue),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(context.l10n.addressSoon)));
        },
        icon: const Icon(Icons.add),
        label: Text(context.l10n.addAddress),
      ),
    );
  }
}
