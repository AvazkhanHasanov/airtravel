import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButtonWithRow extends StatelessWidget {
  const AppTextButtonWithRow({
    super.key,
    this.height = 58,
    this.width = 380,
    this.radius = 29,
    this.isLoading = false,
    required this.onPressed,
    required this.children,
    this.progressColor,
    this.borderColor = Colors.transparent,
    this.backgroundColor = AppColors.greyscale900,
  });

  final double width;
  final double height;
  final bool isLoading;
  final List<Widget> children;
  final Color? progressColor;
  final VoidCallback? onPressed;
  final double radius;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: AppColors.greyscale500,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(color: progressColor)
            : Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
      ),
    );
  }
}
