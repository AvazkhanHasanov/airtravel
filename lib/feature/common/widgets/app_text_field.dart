import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.prefixIconColor = AppColors.black,
    this.suffixIconColor = AppColors.black,
    this.fillColor = AppColors.white,
    required this.hintText,
    this.readOnly = false,
    this.inputFormatter,
    this.keyboardType,
    this.width = 311,
    this.controller,
    this.validator,
    this.onChanged,
    this.suffix,
    this.prefix,
    this.onTap,
    super.key,
  });

  final double width;
  final bool readOnly;

  final String? suffix;
  final String? prefix;
  final String hintText;
  final Color fillColor;
  final VoidCallback? onTap;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44,
          width: width.w,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(5), offset: const Offset(0, 1), blurRadius: 2),
                BoxShadow(color: const Color(0xFF32325D).withAlpha(35), offset: const Offset(0, 1), blurRadius: 3),
              ],
            ),
            child: TextFormField(
              onTap:
                  onTap ??
                  () {
                    if (readOnly) FocusScope.of(context).unfocus();
                  },
              readOnly: readOnly,
              onChanged: onChanged,
              validator: validator,
              controller: controller,
              keyboardType: keyboardType,
              cursorColor: AppColors.greyscale500,
              inputFormatters: inputFormatter,
              decoration: InputDecoration(
                filled: true,
                fillColor: fillColor,
                prefixIcon: prefix != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: SvgPicture.asset(
                          prefix!,
                          width: 20.r,
                          height: 20.r,
                          colorFilter: ColorFilter.mode(prefixIconColor, BlendMode.srcIn),
                        ),
                      )
                    : null,
                prefixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
                suffixIconConstraints: BoxConstraints.loose(Size(double.infinity, double.infinity)),
                suffixIcon: suffix != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: SvgPicture.asset(
                          suffix!,
                          width: 24.r,
                          height: 24.r,
                          colorFilter: ColorFilter.mode(suffixIconColor, BlendMode.srcIn),
                        ),
                      )
                    : null,
                hintStyle: AppStyles.bodyRegular.copyWith(color: AppColors.greyscale500),
                hintText: hintText,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
