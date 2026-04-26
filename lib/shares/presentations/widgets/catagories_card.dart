import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/shares/presentations/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

import '../../../app/app_color.dart';
import '../../../features/product/presentation/screeen/product_list_screen.dart';
import '../../data/model/category_list_model.dart';

class CatagoriesCard extends StatelessWidget {
  const CatagoriesCard({
    super.key, required this.categoryModel,
  });
  final CategoryListModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductList.name,arguments: categoryModel);
      },
      child: Column(
        mainAxisSize: .min,
        children: [
          Card(
            color: AppColor.themeColor.withAlpha(20),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: AppNetworkImage(url: categoryModel.icon,height: 48,width: 48,),
            ),
          ),
          Flexible(
            child: Text(getTitle(categoryModel.title,),maxLines: 1,style: context.textTheme.bodySmall?.copyWith(
                color: AppColor.
                themeColor,
                fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis
            ),
            ),
          )
        ],
      ),
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