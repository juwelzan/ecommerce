class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? emailVerified;
  final String? phone;
  final bool? phoneVerified;
  final String? avatarUrl;
  final String? city;
  final int? role;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerified,
    this.phone,
    this.phoneVerified,
    this.avatarUrl,
    this.city,
    this.role,
  });

  String get fullName {
    final first = firstName?.trim() ?? '';
    final last = lastName?.trim() ?? '';
    if (first.isEmpty && last.isEmpty) {
      return email ?? 'User';
    }
    if (first.isEmpty) return last;
    if (last.isEmpty) return first;
    return '$first $last';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      emailVerified: json['email_verified'] as bool?,
      phone: json['phone'] as String?,
      phoneVerified: json['phone_verified'] as bool?,
      avatarUrl: json['avatar_url'] as String?,
      city: json['city'] as String?,
      role: json['role'] is int ? json['role'] as int : int.tryParse('${json['role']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'email_verified': emailVerified,
      'phone': phone,
      'phone_verified': phoneVerified,
      'avatar_url': avatarUrl,
      'city': city,
      'role': role,
    };
  }

  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? emailVerified,
    String? phone,
    bool? phoneVerified,
    String? avatarUrl,
    String? city,
    int? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      phone: phone ?? this.phone,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      city: city ?? this.city,
      role: role ?? this.role,
    );
  }
}
