import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,required this.icon, required this.onTap,
  });
  final icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:EdgeInsetsGeometry.all(6),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(50)
        ),

        child: Icon(icon,size: 20,color: Colors.grey,),
      ),
    );
  }
}