import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:crafty_bay/shares/presentations/widgets/checkout_price_cart.dart';
import 'package:crafty_bay/shares/presentations/widgets/increment_decrement_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_color.dart';
import '../../../../shares/presentations/provider/main_nav_provider.dart';
import '../../../home/presentation/widgets/home_carousel_slider.dart';

class ProductsDetails extends StatefulWidget {
   ProductsDetails({super.key,  required this.Productdetails, });
  final String Productdetails;
static const String name = '/productsDetails';
  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {

  //color
  final List<Color> colors=[
    Colors.black,
    Colors.teal,
    Colors.brown,
    Colors.grey.shade300,
    Colors.grey,
  ];

  // size
  Color selectedColor = AppColor.themeColor;
  int selectedSizeIndex=0;
  final List<String> sizes=['S','M','L','XL'];


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  Text(widget.Productdetails,),
          leading: IconButton(onPressed: (){
            context.read<MainNavProvider>().moveToHome();
          }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: Column(
          children: [

            Expanded(
                    child:
                    Column(

                      children: [



                        SizedBox(
                          height: 220,
                          child: HomeCarouselSlider(),
                        ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 16,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Happy New Year Special Deal',style: context.textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600
                                        ),),
                                        Text('Save 30%',style: context.textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w600
                                        ),),
                                        const SizedBox(height: 16,),
                                        Row(
                          
                          
                                          spacing: 5,
                                          children: [
                                            Wrap(
                                              children: [
                                                Icon(Icons.star, color: Colors.amber, size: 16),
                                                Text('4.5', overflow: TextOverflow.ellipsis),
                                              ],
                                            ),
                                            SizedBox(width: 4),
                          
                                            Text(
                                              'Reviews',
                                              style: TextStyle(
                                                color: AppColor.themeColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                          
                                            Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: AppColor.themeColor,
                                                borderRadius: BorderRadius.circular(4),
                                              ),
                                              child: Icon(
                                                Icons.favorite_outline,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  IncrementDecrementButton(
                                    onChanged: (int value){
                          
                                    }, initialValue: 3,
                                  )
                          
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Color',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                children:List.generate(colors.length, (index){
                                   return GestureDetector(
                                       onTap: (){
                                         setState(() {
                                           selectedColor=colors[index];
                                         });
                                       },
                                     child: Container(
                                       margin: EdgeInsets.only(right: 12),
                                       width: 30,
                                       height: 30,
                          
                                       decoration: BoxDecoration(
                                         color: colors[index],
                                       shape: BoxShape.circle,
                                         border: Border.all(
                                           color: selectedColor==colors[index]?AppColor.themeColor : Colors.transparent
                                         )
                                       ),
                                       child: selectedColor==colors[index]? Icon(Icons.check,color: Colors.white,size: 18,):null ,
                          
                                     ),
                                   );
                                })
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Size',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                  children:List.generate(sizes.length, (index){
                                    final isSelected=selectedSizeIndex==index;
                                    return GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          selectedSizeIndex=index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 12),
                                        width: 30,
                                        height: 30,
                          
                                        decoration: BoxDecoration(
                                            color: isSelected?selectedColor:Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.grey
                                            )
                                        ),
                                        child: Center(
                                          child: Text(sizes[index],
                                          style: TextStyle(
                                            color: isSelected?Colors.white : Colors.black
                                          ),
                                          ),
                                        ) ,
                          
                                      ),
                                    );
                                  })
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Description',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12,),
                              Text("The shoes in the image are the iconic Nike Air Jordan 1 high-top sneakers, featured in a classic red, black, and white colorway often referred to as 'Bred' or 'Chicago' variations. Launched in 1985 as Michael Jordan's first signature shoe with Nike, the Air Jordan 1 quickly became a cultural phenomenon, elevating basketball footwear from mere sports equipment to an iconic fashion statement. The original black and red version was famously banned by the NBA for violating uniform policies, adding to its legendary status. These sneakers feature a leather upper, foam midsole with Nike Air cushioning, and a durable rubber outsole. The design is credited with creating modern sneaker culture and remains one of the most popular silhouettes in historyDisclaimer: The information provided is for general knowledge and style purposes, and does not constitute professional advice regarding footwear, comfort, or health."),
                              const SizedBox(height: 50),
                          
                          
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
                ),
              CheckOutPriceCard(cartItem: 'Add To Cart'),

          ],
        ),

      ),
    );
  }
}
