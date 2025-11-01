import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForMoreFeature extends StatelessWidget {
  const ForMoreFeature({
    super.key,
    required this.featureCount,
  });

  final int featureCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.r),
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 1.5),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '$featureCount+',
                textAlign: TextAlign.center,
                style: AppStyles.h10Bold.copyWith(
                  color: AppColors.white,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
