import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/shares/presentations/widgets/increment_decrement_button.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_color.dart';
import '../../../../app/app_constants.dart';
import '../../../../app/assets_path.dart';


class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
  });

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
                  boxShadow: [

                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsPath.productPath,
                      height: 100,
                      width: 100,
                    ),
                    const SizedBox(width: 7),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Year Special shows',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            'Color:Red Size:x',
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
                                "${Constants.takaSign}100",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.themeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                             IncrementDecrementButton(
                                 initialValue: null,
                               onChanged: (int value) {
                                   print(value);
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
}

// module 30 er 4 no. video after start 49.00 again