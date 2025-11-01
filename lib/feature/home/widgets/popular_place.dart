import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularPlace extends StatelessWidget {
  const PopularPlace({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24.w),
        itemCount: images.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(images[index], width: 104.w, height: 52.h, fit: BoxFit.cover),
                Text('Makka', style: AppStyles.bodyLarge.copyWith(color: AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
