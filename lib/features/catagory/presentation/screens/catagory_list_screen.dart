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
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catagories"),
          leading: IconButton(onPressed: (){
            context.read<MainNavProvider>().moveToHome();
          }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: GridView.builder(
          itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 4,
                mainAxisSpacing: 8,
                crossAxisCount: 4),
            itemBuilder: (context, index){
          return FittedBox(child: CatagoriesCard());
        }),
      
      ),
    );
  }
}

// 24:16 minutee after starting