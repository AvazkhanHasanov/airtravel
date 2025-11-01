import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KunContainer extends StatelessWidget {
  const KunContainer({
    super.key,
    required this.sana,
  });

  final String sana;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 21.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.greyscale900,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        sana,
        style: AppStyles.bodyLarge.copyWith(fontSize: 14.sp, color: AppColors.white),
      ),
    );
  }
}
