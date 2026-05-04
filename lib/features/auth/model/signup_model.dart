class SignupModel {
  final String? fastName, lastName, email, password, city, number;

  SignupModel({
    this.fastName,
    this.lastName,
    this.email,
    this.password,
    this.city,
    this.number,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": fastName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": number,
      "city": city,
    };
  }
}
