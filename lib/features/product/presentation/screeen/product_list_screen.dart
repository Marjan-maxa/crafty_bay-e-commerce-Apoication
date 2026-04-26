import 'package:crafty_bay/features/auth/presentation/widgets/center_indicator.dart';
import 'package:crafty_bay/features/product/provider/product_list_provider.dart';
import 'package:crafty_bay/shares/data/model/category_list_model.dart';
import 'package:crafty_bay/shares/presentations/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.category});
  static const String name = '/productList';
  final CategoryListModel category;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductListProvider _productListProvider = ProductListProvider();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productListProvider.getProduct(widget.category.id);
      _scrollController.addListener(loadMore);
    });
  }

  void loadMore() {
    if (_productListProvider.isLoading) {
      return;
    }
    if (_scrollController.position.extentBefore < 300) {
      _productListProvider.getProduct(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.title)),
        body: Consumer<ProductListProvider>(
          builder: (context, productListProvider, child) {
            if (productListProvider.isInitialLoading) {
              return CenterIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: productListProvider.productlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCart(
                          productListModel:
                              productListProvider.productlist[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }


}
