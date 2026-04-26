import 'package:flutter/material.dart';

import '../../../../shares/presentations/widgets/product_cart.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(

        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index)=>const SizedBox(),
        separatorBuilder: (BuildContext context, int index)=>const SizedBox(),


      ),
    );
  }
}