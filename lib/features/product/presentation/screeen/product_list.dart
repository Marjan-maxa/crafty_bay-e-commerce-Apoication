import 'package:crafty_bay/shares/presentations/widgets/product_cart.dart';
import 'package:flutter/material.dart';

import '../../../../shares/presentations/widgets/catagories_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.categories});
static const String name = '/productList';
final String categories;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.categories),

      ),
      body: GridView.builder(
        itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

            mainAxisSpacing: 8,
              crossAxisCount: 3),
          itemBuilder: (context,index){
        return  FittedBox(child: ProductCart());
      }),
    );
  }
}
