import 'package:flutter/material.dart';

import '../../../../shares/presentations/widgets/catagories_card.dart';

class HomeCtegoryList extends StatelessWidget {
  const HomeCtegoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index)
        {
          return CatagoriesCard();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 25,);
        },

      ),
    );
  }
}