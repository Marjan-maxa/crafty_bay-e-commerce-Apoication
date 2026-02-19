import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';

class logo_app extends StatelessWidget {
  const logo_app({
    super.key,
    this.height=120,
    this.width=120,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logo_Path,height: height,width: width,);
  }
}