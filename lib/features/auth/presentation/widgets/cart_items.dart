import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/features/cart/data/models/cart_model.dart';
import 'package:crafty_bay/features/cart/providers/cart_list_provider.dart';
import 'package:crafty_bay/shares/presentations/widgets/app_network_image.dart';
import 'package:crafty_bay/shares/presentations/widgets/increment_decrement_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_color.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/assets_path.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppNetworkImage(
                      url: _getImages(cartModel.productModel.images),
                      fit: BoxFit.scaleDown,
                      width: 100,
                      height: 80,
                    ),
                    const SizedBox(width: 7),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartModel.productModel.title,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            'Color:${cartModel.color ?? 'N/A'} , Size: ${cartModel.size ?? 'N/A'}',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${Constants.takaSign}${cartModel.productModel.currentPrice}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.themeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IncrementDecrementButton(
                                initialValue: cartModel.quantity,
                                maxValue: 5,

                                onChanged: (int value) {
                                  context
                                      .read<CartListProvider>()
                                      .updateCartItemQuantity(
                                        cartModel.id,
                                        value,
                                      );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }

  String _getImages(List<String> urls) {
    return urls.isNotEmpty ? urls.first : '';
  }
}

// module 30 er 4 no. video after start 49.00 again
