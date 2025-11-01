import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/app_text_button.dart';
import 'package:air_travel/feature/home/widgets/destinations.dart';
import 'package:air_travel/feature/home/widgets/place_image.dart';
import 'package:air_travel/feature/home/widgets/plan_types.dart';
import 'package:air_travel/feature/home/widgets/travel_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TravelPackages extends StatefulWidget {
  const TravelPackages({
    super.key,
    required this.images,
    required this.days,
    required this.startDate,
    required this.endDate,
    required this.title,
  });

  final int days;
  final String startDate;
  final String endDate;
  final String images;
  final String title;

  @override
  State<TravelPackages> createState() => _TravelPackagesState();
}

class _TravelPackagesState extends State<TravelPackages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints(minHeight: 529.h, maxHeight: 600),
      width: 302.w,
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
            image: widget.images,
            days: widget.days,
            startDate: widget.startDate,
            endDate: widget.endDate,
          ),
          Text(widget.title, style: AppStyles.h6Bold),
          SizedBox(
            height: 23.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 12.width,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                height: 23.h,
                padding: EdgeInsets.only(right: 2, left: 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  border: BoxBorder.all(color: AppColors.greyscale900),
                ),
                child: Destinations(
                  ccity: 'Madina',
                  duration: 12,
                ),
              ),
            ),
          ),
          Text("Sayohat tarkibi", style: AppStyles.h6Bold),
          SizedBox(
            height: 20.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => 4.width,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => TravelFeatures(title: 'Sug\'urta'),
            ),
          ),
          Text("Tariflar", style: AppStyles.h6Bold),
          Expanded(
            child: RawScrollbar(
              thumbColor: AppColors.greyscale900,
              interactive: true,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => 8.width,
                itemCount: 4,
                itemBuilder: (context, index) =>
                    PlanTypes(type: 'Bussines', price: 1200, discountedPrice: 1000, feature: []),
              ),
            ),
          ),
          AppTextButton(
            height: 45.h,
            text: 'Batafsil...',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
