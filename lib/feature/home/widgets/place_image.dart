import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:air_travel/feature/home/widgets/kun_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.image,
    required this.days,
    required this.startDate,
    required this.endDate,
  });

  final int days;
  final String startDate;
  final String endDate;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withAlpha((255 * 40 / 100).toInt()), BlendMode.darken),
            child: Image.asset(image, width: 285.w, height: 169.h, fit: BoxFit.cover),
          ),
        ),

        Positioned(
          left: 17.w,
          top: 23.h,
          child: KunContainer(sana: '$days kun '),
        ),
        Positioned(
          bottom: 13.h,
          left: 50.w,
          child: Row(
            spacing: 8.w,
            children: [
              SvgPicture.asset(AppIcons.flight),
              KunContainer(sana: startDate),
              SvgPicture.asset(AppIcons.landing),
              KunContainer(sana: endDate),
            ],
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.w,
          child: AppIconButton(
            icon: AppIcons.heart,
            size: Size(30.w, 30.h),
            height: 16.h,
            width: 16.w,
            radius: 15.r,
            backgroundColor: AppColors.greyscale900,
            foregroundColor: AppColors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
