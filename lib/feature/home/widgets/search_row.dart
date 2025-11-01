import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:air_travel/feature/common/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextFormField(
            hintText: 'Search',
            controller: controller,
            fillColor: AppColors.greyscale100,
            prefix: AppIcons.search,
            prefixIconColor: AppColors.greyscale400,
          ),
          AppIconButton(
            icon: AppIcons.filter,
            onPressed: () {},
            foregroundColor: AppColors.greyscale500,
            width: 20.w,
            height: 20.h,
          ),
          AppIconButton(
            icon: AppIcons.notifications,
            onPressed: () {},
            foregroundColor: AppColors.greyscale500,
          ),
        ],
      ),
    );
  }
}
