import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}
final ValueNotifier _selectedpage=ValueNotifier(0);
class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height:190.0,
            viewportFraction: 1,onPageChanged: (index,reson)=>_selectedpage.value=index,
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                      borderRadius: BorderRadius.circular(8)

                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectedpage,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
               for(int i=0;i<5;i++)
                 Container(
                   width: 10,
                   height: 10,
                   decoration: BoxDecoration(
                       color: value==i? AppColor.themeColor :Colors.transparent,
                       border: Border.all(color: Colors.grey),
                       borderRadius: BorderRadius.circular(50)
                   ),
            
                 )
              ],
            );
          }
        )
      ],
    );
  }
}
