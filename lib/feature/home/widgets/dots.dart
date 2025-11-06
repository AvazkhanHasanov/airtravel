import 'package:air_travel/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
    required this.currentIndex,
    required this.imagesCount,
    this.activeColor = AppColors.greyscale900,
    this.inactive = AppColors.greyscale400,
    this.backgroundColor = AppColors.white,
  });

  final int imagesCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactive;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Container(
        height: 8.w,
        width: (imagesCount * 9 + 22).w,
        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(5.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(imagesCount, (index) {
            bool isActive = currentIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 4.h,
              width: isActive ? 16.w : 4.w,
              decoration: BoxDecoration(
                color: isActive ? activeColor : inactive,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ),
    );
  }
}
