import 'package:ecommerce/shared/path/paths.dart';

class TextPastFormatter extends TextInputFormatter {
  final Function(String) onPast;
  TextPastFormatter({required this.onPast});
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > 1) {
      onPast(newValue.text);
      return const TextEditingValue();
    }
    return newValue;
  }
}
