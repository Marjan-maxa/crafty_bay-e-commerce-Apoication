import 'package:flutter/material.dart';

import '../../../app/app_color.dart';

class AddRemovePaymentButton extends StatelessWidget {
  const AddRemovePaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 30,
            height: 30,

            child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),

                  ),

                ),
                onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,size: 16,))),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("01",style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
            width: 28,
            height: 28,

            child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.themeColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),

                  ),

                ),
                onPressed: (){}, icon: Icon(Icons.remove,color: Colors.white,size: 16,))),
      ],
    );
  }
}