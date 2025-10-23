import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    this.fontSize,
    this.fontWeight,
    this.height = 58,
    this.width = 380,
    this.radius = 29,
    required this.text,
    this.borderWidth = 1,
    this.isLoading = false,
    required this.onPressed,
    this.textColor=AppColors.white,
    this.borderColor = Colors.transparent,
    this.progressColor = AppColors.borderColor,
    this.backgroundColor = AppColors.greyscale900,
    super.key,
  });

  final String text;
  final double width;
  final double height;
  final double radius;
  final bool isLoading;
  final Color textColor;
  final double? fontSize;
  final Color borderColor;
  final double borderWidth;
  final Color progressColor;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(radius.r),
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: progressColor))
            : Text(
                text,
                style: AppStyles.bodyLarge.copyWith(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
              ),
      ),
    );
  }
}
