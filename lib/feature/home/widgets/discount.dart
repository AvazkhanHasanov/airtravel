import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Discount extends StatelessWidget {
  const Discount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 11.h,
      left: -7.w,
      child: Transform.rotate(
        angle: -0.7,
        child: Container(
          alignment: Alignment.center,
          width: 48.w,
          height: 11.h,
          color: AppColors.yellowBorder,
          child: Text(
            '%Chegirma',
            style: AppStyles.h11Bold.copyWith(
              color: AppColors.greyscale900,
              fontSize: 7.sp,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
    );
  }
}
