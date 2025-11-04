import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
    this.arrowColor = Colors.black87,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = false,
  });

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color arrowColor;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 40.w,
      leading: leading ??
          (showBackButton
              ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              AppIcons.backArrow,
              colorFilter: ColorFilter.mode(arrowColor, BlendMode.srcIn),
            ),
          )
              : null),
      centerTitle: centerTitle,
      title: Text(
        title,
        style: AppStyles.h4Bold.copyWith(color: textColor),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
