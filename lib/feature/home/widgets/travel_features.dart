import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelFeatures extends StatelessWidget {
  const TravelFeatures({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      padding: EdgeInsets.only(left: 1, right: 2.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: BoxBorder.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIconButton(
            icon: AppIcons.tick,
            onPressed: () {},
            width: 10.w,
            height: 10.h,
            backgroundColor: AppColors.greyscale900,
            foregroundColor: AppColors.white,
            size: Size(16.r, 16.r),
          ),
          Text(
            title.length > 10 ? '${title.substring(0, 10)}...' : title,
            style: AppStyles.h10Bold.copyWith(color: AppColors.greyscale900, letterSpacing: -0.2),
          ),
        ],
      ),
    );
  }
}
