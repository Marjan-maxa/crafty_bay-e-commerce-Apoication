import 'package:flutter/material.dart';

import '../../../app/app_color.dart';
import '../../../app/app_constants.dart';

class CheckOutPriceCard extends StatelessWidget {
  const CheckOutPriceCard({
    super.key, required this.cartItem, required this.price,
  });
  final String cartItem;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.themeColor.withAlpha(20),
        borderRadius: BorderRadius.circular(15),
      ),

      padding: const EdgeInsets.all(20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Total Price",
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 4),
              Text("${Constants.takaSign}$price",
                  style: TextStyle(
                    color: AppColor.themeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            width: 150,
            child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: AppColor.themeColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                )
                ,
                onPressed: (){}, child: Text(cartItem)),
          )
        ],
      ),
    );
  }
}
