import 'package:air_travel/core/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';

class Aloqa extends StatelessWidget {
  const Aloqa({
    super.key,
    required this.item,
  });

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Container(
        height: 72.h,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.grey56,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              item['icon']!,
              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ),
            20.width,
            Text(
              item['title']!,
              style: AppStyles.h6Bold.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
