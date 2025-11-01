import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/feature/home/widgets/discount_time.dart';
import 'package:air_travel/feature/home/widgets/travel_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 427.w,
      constraints: BoxConstraints(minHeight: 800.h),
      padding: EdgeInsets.only(top: 10.h, bottom: 14.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.greyscale900,
            AppColors.orange.withAlpha((255 * 58 / 100).toInt()),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 26.h,
        children: [
          DiscountTime(discount: 23).paddingOnly(left: 20.w),
          SizedBox(
            height: 529.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 12.width,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) => TravelPackages(
                images: images[index],
                days: 14,
                startDate: '14 Okt',
                endDate: '27 Okt',
                title: 'Umra Safari',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
