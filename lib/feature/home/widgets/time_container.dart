import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    super.key,
    required this.time,
  });

  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      height: 37.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: BoxBorder.all(color: AppColors.greyscale200),
        color: AppColors.white.withAlpha((255 / 2).toInt()),
      ),
      child: Text('$time', style: AppStyles.h5Bold),
    );
  }
}
