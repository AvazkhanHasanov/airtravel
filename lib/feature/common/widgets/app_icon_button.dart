import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    this.width = 24,
    this.height = 24,
    this.radius = 12,
    this.borderWidth = 1,
    required this.icon,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.borderColor = Colors.transparent,
    this.backgroundColor = AppColors.white,
    this.size = const Size(30, 30),
    this.foregroundColor = AppColors.greyscale900,
    super.key,
  });

  final Size size;
  final String icon;
  final double width;
  final double height;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(size),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.r),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
        backgroundColor: backgroundColor,
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
      ),
    );
  }
}
