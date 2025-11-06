import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/packages/retrieve_feature_model.dart';

class TitleFeature extends StatelessWidget {
  const TitleFeature({
    super.key,
    required this.title,
    required this.feature,
  });

  final String title;
  final List<RetrieveFeatureModel> feature;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(140),
            blurRadius: 18,
            blurStyle: BlurStyle.inner,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.h6Bold),
          Wrap(
            spacing: 12,
            children: [
              ...List.generate(
                feature.length,
                (index) => Text(
                  feature[index].title,
                  maxLines: 3,
                  style: AppStyles.h10Bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
