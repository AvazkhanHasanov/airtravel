import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  Widget get height => SizedBox(height: toDouble().h);

  Widget get width => SizedBox(width: toDouble().w);// chunki this optional ekan yani this bolsa shunday o`qiydi bo`lsa this qo`shib o`qiydi
}
