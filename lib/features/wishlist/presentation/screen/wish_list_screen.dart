import 'package:crafty_bay/shares/presentations/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shares/presentations/provider/main_nav_provider.dart';
import '../../../../shares/presentations/widgets/catagories_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, required this.categories});
  static const String name = '/wishList';
  final String categories;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categories),
          leading: IconButton(onPressed: ()=>context.read<MainNavProvider>().moveToHome(), icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
        ),
        body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8
        ), itemBuilder: (context,index){
          return FittedBox(child: ProductCart());
        }),

      ),
    );

  }
}

// 50.05 minute after  start
