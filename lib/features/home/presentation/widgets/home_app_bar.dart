import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';

import 'app_bar_icon_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: SvgPicture.asset(AssetsPath.logo_nav_Path,),
      centerTitle: false,
      actions: [
        AppBarIconButton(icon: Icons.person, onTap: () {
        },),
        const SizedBox(width: 8,),
        AppBarIconButton(icon: Icons.call, onTap: () {  },),
        const SizedBox(width: 8,),
        AppBarIconButton(icon: Icons.notification_add_outlined, onTap: () {  },),
        const SizedBox(width: 8,),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}