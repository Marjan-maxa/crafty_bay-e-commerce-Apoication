import 'package:crafty_bay/features/product/presentation/models/product_list_model.dart';
import 'package:crafty_bay/features/product/presentation/screeen/products_details_screen.dart';
import 'package:crafty_bay/shares/presentations/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app/app_color.dart';
import '../../../app/app_constants.dart';
class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key, required this.productListModel,
  });
final ProductListModel productListModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductsDetailsScreen.name, arguments: productListModel.id);
      },
      child: SizedBox(
        width: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 3,
          shadowColor: AppColor.themeColor.withAlpha(30),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(7.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: 140,
                  width: 160,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.themeColor.withAlpha(20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),

                  child: AppNetworkImage(url: _getImages(productListModel.images)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productListModel.title,maxLines: 1,style: TextStyle(
                        fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                          overflow:TextOverflow.ellipsis
                      ),
                      ),
                      Row(


                    spacing: 7,
                        children: [
                          Text(
                            '${Constants.takaSign}${productListModel.currentPrice}',
                            style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Wrap(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Text('${productListModel.rating}', overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          SizedBox(width: 4),

                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: AppColor.themeColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  String _getImages(List<String> urls) {
    return urls.isNotEmpty ? urls.first : '';
  }
}
