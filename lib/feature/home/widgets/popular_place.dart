import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/popular_model.dart';

class PopularPlace extends StatelessWidget {
  const PopularPlace({
    super.key,

    required this.popular,
  });

  final List<PopularModel> popular;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 24.w),
        itemCount: popular.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(popular[index].picture, width: 104.w, height: 52.h, fit: BoxFit.cover),
                Text(popular[index].title, style: AppStyles.bodyLarge.copyWith(color: AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
