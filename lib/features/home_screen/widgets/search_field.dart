import 'package:ecommerce/shared/path/paths.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: _decoration,
            enabledBorder: _decoration,
            errorBorder: _decoration,
            border: _decoration,
            filled: true,
          ),
          style: TextStyle(fontSize: 15.f),
        ),
      ),
    );
  }
}

InputBorder get _decoration => OutlineInputBorder(
  borderRadius: BorderRadius.circular(15.r),
  borderSide: BorderSide.none,
);
