class Validation {
  Validation._();
  static bool email(String email) {
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return regex.hasMatch(email);
  }

  static bool phone(String phone) {
    final regex = RegExp(r'^01[3-9]\d{8}$');
    return regex.hasMatch(phone);
  }
}
