import 'package:flutter/material.dart';

class SearchBarFeild extends StatelessWidget {
  const SearchBarFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border
      ),
    );

  }
  OutlineInputBorder get _border{
    return OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12)
    );
  }
}