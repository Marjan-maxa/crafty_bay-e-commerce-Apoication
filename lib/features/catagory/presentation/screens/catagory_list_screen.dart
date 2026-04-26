import 'package:crafty_bay/features/auth/presentation/widgets/center_indicator.dart';
import 'package:crafty_bay/shares/presentations/provider/category_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shares/presentations/provider/main_nav_provider.dart';
import '../../../../shares/presentations/widgets/catagories_card.dart';

class CatagoryListScreen extends StatefulWidget {
  const CatagoryListScreen({super.key});
  static const String name = '/catagoryList';
  @override
  State<CatagoryListScreen> createState() => _CatagoryListScreenState();
}

class _CatagoryListScreenState extends State<CatagoryListScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

 _scrollController.addListener(_moreload);
  }

  void _moreload() {
    if (context.read<CategoryListProvider>().isLoading) return;

    if (_scrollController.position.extentBefore<300) {
      context.read<CategoryListProvider>().getCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        context.read<MainNavProvider>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catagories"),
          leading: IconButton(
            onPressed: () {
              context.read<MainNavProvider>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: Consumer<CategoryListProvider>(
          builder: (context, categoryListProvider, child) {
            if (categoryListProvider.isInitialLoading &&
                categoryListProvider.categories.isEmpty) {
              return CenterIndicator();
            }
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: categoryListProvider.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 8,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CatagoriesCard(
                          categoryModel: categoryListProvider.categories[index],
                        ),
                      );
                    },
                  ),
                ),
                if (categoryListProvider.ismoreDataLoading) LinearProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.removeListener(_moreload);
    _scrollController.dispose();
    super.dispose();
  }
}

// 24:16 minutee after starting
