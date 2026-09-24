import 'package:ecommerce/shared/path/paths.dart';

class AddressScreen extends StatelessWidget {
  static const String name = '/AddressScreen';
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Addresses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
                child: Icon(Icons.home_outlined, color: context.theme.primaryColor),
              ),
              title: const Text('Home Address'),
              subtitle: const Text('House #12, Road #4, Block C, Dhaka, Bangladesh'),
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
              leading: const CircleAvatar(
                child: Icon(Icons.work_outline),
              ),
              title: const Text('Work Address'),
              subtitle: const Text('Level 5, Software Technology Park, Dhaka'),
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add Address feature coming soon!')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add New Address'),
      ),
    );
  }
}
