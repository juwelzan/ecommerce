import 'package:ecommerce/shared/path/paths.dart';

InputDecoration decorationEliment({
  bool? isError = false,
  String? errorText,
  String? labelText,
  String? hintText,
}) {
  return InputDecoration(
    filled: isError,
    hintText: hintText,
    labelText: labelText,
    fillColor: isError! ? Colors.redAccent.withValues(alpha: 0.2) : null,
    errorText: isError ? errorText : null,
  );
}

TextStyle textStyleEliment() {
  return TextStyle(fontSize: 14.f, fontWeight: FontWeight.w400);
}
