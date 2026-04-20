import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/auth/presentation/provider/home_slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shares/presentations/widgets/app_network_image.dart';
class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

final ValueNotifier<int> _selectedpage = ValueNotifier<int>(0);

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeSliderProvider>(
      builder: (context, homeSliderProvider, _) {
        if (homeSliderProvider.getHomeSliderProgress) {
          return SizedBox(
            height: 220,
              child: Center(child: CircularProgressIndicator()));
        }

        return SizedBox(
          height: 240,
          child: Stack(
            children: [
          CarouselSlider(
          options: CarouselOptions(
          height: 220.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedpage.value = index;
            },
          ),
          items: homeSliderProvider.HomeSlider.map((slider) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: AppColor.themeColor.withAlpha(190),

                ),
                child: AppNetworkImage(url: slider.photoUrl,
                  fit: BoxFit.cover,
                ),

              ),
            );
          }).toList(),
        ),
              const SizedBox(height: 8),
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: ValueListenableBuilder(
                  valueListenable: _selectedpage,
                  builder: (context, value, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        for (int i = 0; i < homeSliderProvider.HomeSlider.length; i++)
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: value == i
                                  ? AppColor.themeColor
                                  : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// 43: 00 after start