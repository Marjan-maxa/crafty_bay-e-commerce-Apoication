import 'package:flutter/material.dart';

import '../../../app/app_color.dart';
import '../../../app/app_constants.dart';
import '../../../app/assets_path.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        shadowColor: AppColor.themeColor.withAlpha(30),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 140,
              width: 180,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.themeColor.withAlpha(20),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),

              child: Image.asset(AssetsPath.productPath),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                spacing: 4,
                children: [
                  Text('Nike A34RF -New Edition 2026 Alfa',maxLines: 1,style: TextStyle(
                    fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                      overflow:TextOverflow.ellipsis
                  ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        '${Constants.takaSign}1200',
                        style: TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(width: 6),

                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text('4.5'),
                        ],
                      ),
                      SizedBox(width: 6),

                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColor.themeColor,
                          borderRadius: BorderRadius.circular(5),
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
    );
  }
}
