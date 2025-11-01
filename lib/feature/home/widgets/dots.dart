import 'package:air_travel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
    required this.images,
    required this.currentIndex,
  });

  final List<String> images;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        height: 8.w,
        width: (images.length * 9 + 22).w,
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            bool isActive = currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 4.h,
              width: isActive ? 16.w : 4.w,
              decoration: BoxDecoration(
                color: isActive ? AppColors.greyscale900 : AppColors.greyscale400,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ),
    );
  }
}
