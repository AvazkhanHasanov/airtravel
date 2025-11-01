import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dots.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({super.key, required this.images});

  final List<String> images;

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 120.h,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) => setState(() => currentIndex = index),
              ),
              items: widget.images.map(
                (e) {
                  return Image.asset(
                    e,
                    width: 380.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
            ),
          ),
          Dots(images: widget.images, currentIndex: currentIndex),
        ],
      ),
    );
  }
}
