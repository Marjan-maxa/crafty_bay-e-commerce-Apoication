import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/features/product/data/models/add_to_cart_params.dart';
import 'package:crafty_bay/features/product/presentation/screeen/product_review.dart';
import 'package:crafty_bay/features/product/provider/add_to_cart_provider.dart';
import 'package:crafty_bay/features/product/provider/product_details_provider.dart';
import 'package:crafty_bay/shares/presentations/widgets/checkout_price_cart.dart';
import 'package:crafty_bay/shares/presentations/widgets/increment_decrement_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/app_color.dart';
import '../../../../app/controller/auth_controller.dart';
import '../../../../shares/presentations/widgets/show_snakbar_Message.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../home/presentation/widgets/product_cerosol_image.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key, required this.productId});
  final String productId;
  static const String name = '/productsDetails';

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  String? _selectedColor;
  String? _selectedSize;
  String? _lastProductId;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailsProvider>().getProductDetails(
        widget.productId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product Details'),
      ),
      body: Consumer<ProductDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.getProductDetailsProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.errormessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  provider.errormessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          if (provider.productDetails == null) {
            return const Center(child: Text('Product details not found'));
          }

          final product = provider.productDetails!;

          // Reset selection if product id changes
          if (_lastProductId != product.id) {
            _selectedColor = product.colors.firstOrNull;
            _selectedSize = product.sizes.firstOrNull;
            _lastProductId = product.id;
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageCarousel(urls: product.photos),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: context.textTheme.bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        spacing: 5,
                                        children: [
                                          const Wrap(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                              Text('4.5'),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                ProductReview.name,
                                              );
                                            },
                                            child: const Text('Review'),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              color: AppColor.themeColor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Icon(
                                              Icons.favorite_outline,
                                              color: Colors.white,
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IncrementDecrementButton(
                                  maxValue: product.quantity,
                                  onChanged: (int value) {
                                    setState(() {
                                      _quantity = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (product.colors.isNotEmpty) ...[
                              const SizedBox(height: 20),
                              Text(
                                'Color',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: product.colors.map((colorName) {
                                    final isSelected =
                                        _selectedColor?.toLowerCase() ==
                                        colorName.toLowerCase();
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedColor = colorName;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColor.themeColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColor.themeColor
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          colorName,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                            if (product.sizes.isNotEmpty) ...[
                              const SizedBox(height: 20),
                              Text(
                                'Size',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: product.sizes.map((size) {
                                    final isSelected =
                                        _selectedSize?.toLowerCase() ==
                                        size.toLowerCase();
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedSize = size;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColor.themeColor
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: isSelected
                                                ? AppColor.themeColor
                                                : Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          size,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                            const SizedBox(height: 20),
                            Text(
                              'Description',
                              style: context.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(product.description),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CheckOutPriceCard(
                cartItem: 'Add To Cart',
                price: product.currentPrice.toString(),
                onPressedAddToCartItem:
                    context.watch<AddToCartProvider>().addToCartProgress
                    ? null
                    : _onTapAddToCart,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _onTapAddToCart() async {
    if (await AuthController.isLoggedIn() == false) {
      Navigator.pushNamed(context, SignInScreen.name);
      return;
    }

    AddToCartParams params = AddToCartParams(
      productId: widget.productId,
      color: _selectedColor ?? '',
      size: _selectedSize ?? '',
      quantity: _quantity,
    );
    final result = await context.read<AddToCartProvider>().addToCart(params);
    if (result && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to cart successfully!')),
      );
    } else {
      SnakBarMessage(context, context.read<AddToCartProvider>().errorMessage ?? 'Failed to add to cart');
    }
  }
}


//20:50 after start
