import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatefulWidget {
  static const String name = '/EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthController>().user;
    _nameController = TextEditingController(text: user?.fullName ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    final auth = context.read<AuthController>();

    // Split name into first and last name if possible
    final fullName = _nameController.text.trim();
    final parts = fullName.split(' ');
    final firstName = parts.isNotEmpty ? parts.first : fullName;
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    final success = await auth.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phone: _phoneController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.profileUpdated),
          backgroundColor: Colors.green,
        ),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.localizedError(auth.errorMessage, 'profileUpdateError'),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthController>().user;
    final displayName = user?.fullName ?? context.l10n.userFallback;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.editProfile),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor:
                          context.theme.primaryColor.withValues(alpha: 0.1),
                      child: Text(
                        displayName.isNotEmpty
                            ? displayName[0].toUpperCase()
                            : 'U',
                        style: TextStyle(
                          fontSize: 36.f,
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: context.theme.primaryColor,
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(h: 24.h),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: context.l10n.fullName,
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return context.l10n.pleaseEnterName;
                  }
                  return null;
                },
              ),
              Gap(h: 16.h),
              TextFormField(
                controller: _emailController,
                enabled: false, // Email is identifier, immutable from profile update
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: context.l10n.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withValues(alpha: 0.1),
                ),
              ),
              Gap(h: 16.h),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: context.l10n.phoneNumber,
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              Gap(h: 32.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: FilledButton(
                  onPressed: _isSaving ? null : _saveProfile,
                  child: _isSaving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(context.l10n.saveChanges),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
