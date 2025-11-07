import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/status.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/format_date.dart';
import 'package:air_travel/feature/package_detail/managers/detail_bloc.dart';
import 'package:air_travel/feature/package_detail/managers/detail_state.dart';
import 'package:air_travel/feature/package_detail/widgets/detail_picture.dart';
import 'package:air_travel/feature/package_detail/widgets/title_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/for_destinations.dart';

class DayByDay extends StatelessWidget {
  const DayByDay({
    super.key,
    required this.dayNumber,
    required this.date,
  });

  final int dayNumber;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 63.w,
      height: 45.h,
      decoration: BoxDecoration(
        color: AppColors.grey20.withAlpha((255 * 20 / 100).toInt()),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$dayNumber kun',
            style: AppStyles.h6Bold.copyWith(height: 1),
          ),
          Text(
            formatDate(date),
            style: AppStyles.h10Bold.copyWith(height: 1),
          ),
        ],
      ),
    );
  }
}
