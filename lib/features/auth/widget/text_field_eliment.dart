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
    hintStyle: TextStyle(fontSize: 20, color: Colors.black38),
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 20, color: Colors.black38),
    fillColor: isError! ? Colors.redAccent.withValues(alpha: 0.2) : null,
    errorText: isError ? errorText : null,

    // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 3.5,color: )),
  );
}

TextStyle textStyleEliment() {
  return TextStyle(fontSize: 20);
}
