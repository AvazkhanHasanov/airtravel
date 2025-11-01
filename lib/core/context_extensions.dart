import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(
    width: toDouble().w,
  ); // chunki this optional ekan yani this bolsa shunday o`qiydi bo`lsa this qo`shib o`qiydi
}

extension PaddingExtension on Widget {
  Widget paddingAll(double value) => Padding(
    padding: EdgeInsets.all(value.r),
    child: this,
  );

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal.w, vertical: vertical.h),
    child: this,
  );

  Widget paddingOnly({double left = 0, double right = 0, double top = 0, double bottom = 0}) => Padding(
    padding: EdgeInsets.only(left: left.w, right: right.w, top: top.h, bottom: bottom.h),
    child: this,
  );
}
