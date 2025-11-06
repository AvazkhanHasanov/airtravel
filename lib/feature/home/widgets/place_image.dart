import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:air_travel/feature/home/widgets/kun_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceImage extends StatefulWidget {
  const PlaceImage({
    super.key,
    required this.image,
    required this.days,
    required this.startDate,
    required this.endDate,
    this.width = 285,
    this.height = 169,
  });

  final int days;
  final String startDate;
  final String endDate;
  final String image;
  final double width;
  final double height;

  @override
  State<PlaceImage> createState() => _PlaceImageState();
}

class _PlaceImageState extends State<PlaceImage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withAlpha((255 * 40 / 100).toInt()), BlendMode.darken),
            child: Image.network(widget.image, width: widget.width.w, height: widget.height.h, fit: BoxFit.cover),
          ),
        ),

        Positioned(
          left: 17.w,
          top: 23.h,
          child: KunContainer(sana: '${widget.days} kun '),
        ),
        Positioned(
          bottom: 13.h,
          left: 50.w,
          child: Row(
            spacing: 8.w,
            children: [
              SvgPicture.asset(AppIcons.flight),
              KunContainer(sana: widget.startDate),
              SvgPicture.asset(AppIcons.landing),
              KunContainer(sana: widget.endDate),
            ],
          ),
        ),
        Positioned(
          top: 20.h,
          right: 20.w,
          child: AppIconButton(
            icon: isPressed ? AppIcons.heart2 : AppIcons.heart,
            size: Size(30.w, 30.h),
            height: 16.h,
            width: 16.w,
            radius: 15.r,
            backgroundColor: AppColors.greyscale900,
            foregroundColor: AppColors.white,
            onPressed: () => setState(() => isPressed = !isPressed),
          ),
        ),
      ],
    );
  }
}
