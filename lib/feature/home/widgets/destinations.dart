import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Destinations extends StatelessWidget {
  const Destinations({
    super.key,
    required this.ccity,
    required this.duration,
  });

  final String ccity;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 1.w,
      children: [
        AppIconButton(
          icon: AppIcons.calendar,
          onPressed: () {},
          size: Size(20.r, 20.r),
          height: 16.h,
          width: 16.w,
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.greyscale900,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$duration',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 12.sp,
                color: AppColors.greyscale900,
                height: 0.8,
              ),
            ),
            Text(
              'Kun',
              style: AppStyles.bodyLarge.copyWith(
                fontSize: 4.sp,
                color: AppColors.greyscale900,
                height: 1,
              ),
            ),
          ],
        ),
        Text(
          ccity,
          style: AppStyles.bodyLarge.copyWith(
            color: AppColors.greyscale900,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
