import 'package:crafty_bay/features/auth/presentation/widgets/center_indicator.dart';
import 'package:crafty_bay/features/cart/providers/cart_list_provider.dart';
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
  final CartListProvider _cartListProvider=CartListProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
     _cartListProvider.getCartList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cartListProvider,
      child: PopScope(
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
          body: Consumer<CartListProvider>(

            builder: (context,_,child) {
              if(_cartListProvider.getCartListInProgress){
                return CenterIndicator();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: _cartListProvider.cartList.length,
                        itemBuilder: (context,index){
                          return CartItems(cartModel:_cartListProvider.cartList[index] ,);

                        }
                    ),
                  ),
                  const SizedBox(height: 20),
                  CheckOutPriceCard(cartItem: widget.cartItem, price: '0.00',),

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}







