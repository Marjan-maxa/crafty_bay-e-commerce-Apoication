import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:flutter/material.dart';

import '../../../app/app_color.dart';

class CatagoriesCard extends StatelessWidget {
  const CatagoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        Card(
          color: AppColor.themeColor.withAlpha(20),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.monitor,size: 48,color: AppColor.themeColor,),
          ),
        ),
        Text('Electronics',style: context.textTheme.bodyLarge?.copyWith(
            color: AppColor.
            themeColor,
            fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}