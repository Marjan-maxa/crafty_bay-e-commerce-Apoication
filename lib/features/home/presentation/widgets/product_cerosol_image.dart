
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../../shares/presentations/widgets/app_network_image.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> urls;
  const ProductImageCarousel({super.key, required this.urls});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _selectedPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 220.0,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  _selectedPage.value = index;
                },
              ),
              items: widget.urls.map((url) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: AppNetworkImage(url: url, fit: .fitHeight),
                );
              }).toList(),

            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: ValueListenableBuilder(
                valueListenable: _selectedPage,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      for (int i = 0; i < widget.urls.length; i++)
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
      ],
    );
  }
}
