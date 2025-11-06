import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/data/model/packages/destination_model.dart';
import 'package:air_travel/feature/common/widgets/app_text_button.dart';
import 'package:air_travel/feature/home/widgets/destinations.dart';
import 'package:air_travel/feature/home/widgets/place_image.dart';
import 'package:air_travel/feature/home/widgets/plan_types.dart';
import 'package:air_travel/feature/home/widgets/travel_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForDestinations extends StatelessWidget {
  const ForDestinations({
    super.key,
    required this.ccity,
    required this.duration,
  });

  final String ccity;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23.h,
      padding: EdgeInsets.only(right: 2, left: 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        border: BoxBorder.all(color: AppColors.greyscale900),
      ),
      child: Destinations(
        ccity: ccity,
        duration: duration,
      ),
    );
  }
}
