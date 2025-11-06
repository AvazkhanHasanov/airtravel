import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/feature/home/widgets/place_image.dart';
import 'package:air_travel/feature/home/widgets/plan_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import '../../../data/model/packages/destination_model.dart';
import '../../../data/model/packages/feature_model.dart';
import '../../../data/model/packages/plan_model.dart';
import '../../common/widgets/app_text_button.dart';
import 'for_destinations.dart';
import 'travel_features.dart';

class PackageContainer extends StatelessWidget {
  const PackageContainer({
    super.key,
    required this.plans,
    required this.destinations,
    required this.planType,
    required this.features,
    required this.days,
    required this.startDate,
    required this.endDate,
    required this.images,
    required this.title,
  });

  final List<PlanModel> plans;
  final List<DestinationModel> destinations;
  final List<PlanModel> planType;
  final List<FeatureModel> features;
  final int days;
  final String startDate;
  final String endDate;
  final String images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(minHeight: 529.h, maxHeight: 600),
      width: 376.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: BoxBorder.all(
          color: AppColors.gray.withAlpha((255 / 2).toInt()),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        spacing: 6.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PlaceImage(
            image: images,
            days: days,
            startDate: startDate,
            endDate: endDate,
            height: 222,
            width: 361,
          ),
          Text(title, style: AppStyles.h6Bold),
          SizedBox(
            height: 23.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 12.width,
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) => ForDestinations(
                ccity: destinations[index].ccity,
                duration: destinations[index].duration,
              ),
            ),
          ),
          Text("Sayohat tarkibi", style: AppStyles.h6Bold),
          SizedBox(
            height: 20.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 4.width,
              scrollDirection: Axis.horizontal,
              itemCount: features.length,
              itemBuilder: (context, index) => TravelFeatures(title: features[index].title),
            ),
          ),
          Text("Tariflar", style: AppStyles.h6Bold),
          SizedBox(
            height: 110.h,
            child: RawScrollbar(
              thumbColor: AppColors.greyscale900,
              interactive: true,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => 8.width,
                itemCount: plans.length,
                itemBuilder: (context, index) => PlanTypes(
                  type: plans[index].type,
                  price: plans[index].price,
                  discountedPrice: plans[index].price,
                  feature: plans[index].features,
                ),
              ),
            ),
          ),
          AppTextButton(
            height: 45.h,
            text: 'Batafsil...',
            onPressed: () {
              context.push(Routes.detailPackage);
            },
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 24.w);
  }
}
