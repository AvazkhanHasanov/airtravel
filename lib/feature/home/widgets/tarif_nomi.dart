import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TarifNomi extends StatelessWidget {
  const TarifNomi({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19.h,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11.r),
        border: BoxBorder.all(color: AppColors.greyscale900),
      ),
      child: Text(title, style: AppStyles.h10Bold.copyWith(color: AppColors.greyscale900)),
    );
  }
}
