import 'package:crafty_bay/shares/presentations/provider/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_product_cart.dart';
import '../widgets/search_bar_feild.dart';
import '../widgets/section_header.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
          
            children: [
              const SizedBox(height: 12,),
              SearchBarFeild(),
              const SizedBox(height: 15,),
              HomeCarouselSlider(),
              const SizedBox(height: 15,),
              SectionHeader(title: 'Categories', onTapSeeAll: () {
                context.read<MainNavProvider>().moveToCategoryList();
              },),
              const SizedBox(height: 15,),
              HomeCtegoryList(),
              SectionHeader(title: 'Popular', onTapSeeAll: (){
              }),
              HomeProductList(),
              SectionHeader(title: 'Special', onTapSeeAll: (){}),
              HomeProductList(),
              SectionHeader(title: 'New', onTapSeeAll: (){}),
              HomeProductList(),
              const SizedBox(height: 24,)
          
            ],
          ),
        ),
      ),
    );
  }
}













