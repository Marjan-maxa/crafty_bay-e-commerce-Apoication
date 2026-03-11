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
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Card(
            color: AppColor.themeColor.withAlpha(20),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.monitor,size: 32,color: AppColor.themeColor,),
            ),
          ),
        ),
        Flexible(
          child: Text(getTitle('Electronic'),style: context.textTheme.bodySmall?.copyWith(
              color: AppColor.
              themeColor,
              fontWeight: FontWeight.w600),
          ),
        )
      ],
    );

    }
  String getTitle(String name){
    if(name.length>10){
      return name.substring(0,10)+'...';
    }else{
      return name;
    }
  }
}