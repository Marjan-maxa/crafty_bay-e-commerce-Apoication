import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTapSeeAll,
  });
  final String title;
  final VoidCallback onTapSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: context.textTheme.titleLarge),
        TextButton(onPressed: (){}, child: Text('See All',style: TextStyle(color: AppColor.themeColor),))
      ],
    );
  }
}
