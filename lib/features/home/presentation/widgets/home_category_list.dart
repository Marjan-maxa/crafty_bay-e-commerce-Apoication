import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shares/presentations/provider/category_list_provider.dart';
import '../../../../shares/presentations/widgets/catagories_card.dart';
import '../../../auth/presentation/widgets/center_indicator.dart';

class HomeCtegoryList extends StatelessWidget {
  const HomeCtegoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Consumer<CategoryListProvider>(
        builder: (context, categoryListProvider, _) {
          if (categoryListProvider.isInitialLoading) {
            return CenterIndicator();
          }
          return ListView.separated(
            itemCount: getCtegoryLength(categoryListProvider.categories.length),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CatagoriesCard(
                categoryModel: categoryListProvider.categories[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 25);
            },
          );
        },
      ),
    );
  }

  int getCtegoryLength(int length) {
    return length > 10 ? 10 : length;
  }
}
// 1:3:04