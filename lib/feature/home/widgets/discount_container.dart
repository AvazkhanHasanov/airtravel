import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/data/model/packages/package_list_model.dart';
import 'package:air_travel/feature/home/widgets/discount_time.dart';
import 'package:air_travel/feature/home/widgets/travel_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContainer extends StatelessWidget {
  const DiscountContainer({
    super.key,
    required this.package,
  });

  final List<PackageListModel> package;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 427.w,
      constraints: BoxConstraints(minHeight: 634.h),
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
              padding: EdgeInsets.only(left: 20.w),
              separatorBuilder: (context, index) => 12.width,
              scrollDirection: Axis.horizontal,
              itemCount: package.length,
              itemBuilder: (context, index) => TravelPackages(
                plans: package[index].plans,
                features: package[index].coreFeatures,
                images: package[index].picture,
                days: package[index].duration,
                startDate: '14 Okt',
                endDate: '27 Okt',
                title: package[index].title,
                destinations: package[index].destinations,
                planType: package[index].plans,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
