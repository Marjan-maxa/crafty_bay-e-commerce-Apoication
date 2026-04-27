import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shares/presentations/provider/main_nav_provider.dart';
import '../../../auth/presentation/widgets/cart_items.dart';
import '../../../../shares/presentations/widgets/checkout_price_cart.dart';

class CartItemScreen extends StatefulWidget {
  const CartItemScreen({super.key, required this.cartItem});
  static const String name = '/cartItem';
  final String cartItem;
  @override
  State<CartItemScreen> createState() => _CartItemScreenState();
}

class _CartItemScreenState extends State<CartItemScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            context.read<MainNavProvider>().moveToHome();
          }, icon: Icon(Icons.arrow_back_ios_new_outlined)
          ),
          title: Text(widget.cartItem),

        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return CartItems();

                  }
              ),
            ),
            const SizedBox(height: 20),
            CheckOutPriceCard(cartItem: widget.cartItem, price: '0.00',),

          ],
        ),
      ),
    );
  }
}







