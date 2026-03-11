import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/home/presentation/screen/home_screen.dart';
import 'package:crafty_bay/shares/presentations/provider/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/catagory/presentation/screens/catagory_list_screen.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = '/mainNavHolder';
  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {

  final List<Widget> _screens=[
    HomeScreen(),
    CatagoryListScreen(),
    SizedBox(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context,mainNavProvider,_) {
        return Scaffold(
          body: _screens[mainNavProvider.selectedIndex],
           bottomNavigationBar: BottomNavigationBar(
             currentIndex: mainNavProvider.selectedIndex,
             selectedItemColor: AppColor.themeColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              onTap: mainNavProvider.setIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Categories'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'WishList'),


          ]),
        );
      }
    );
  }
}
