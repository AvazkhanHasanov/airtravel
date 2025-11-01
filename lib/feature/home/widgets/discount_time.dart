import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/home/widgets/time_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscountTime extends StatelessWidget {
  const DiscountTime({
    super.key,
    required this.discount,
  });

  final int discount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppIcons.discount),
        Column(
          children: [
            Text(
              'Shoshiling',
              style: AppStyles.h4Bold.copyWith(color: AppColors.white),
            ),
            Text(
              '$discount% gacha chegirma',
              style: AppStyles.h10Bold.copyWith(color: AppColors.white),
            ),
          ],
        ),
        Spacer(),
        Row(
          spacing: 5.5,
          children: [
            TimeContainer(time: 12),
            Text(':', style: AppStyles.h4Bold),
            TimeContainer(time: 24),
            Text(':', style: AppStyles.h4Bold),
            TimeContainer(time: 30),
          ],
        ).paddingOnly(right: 20),
      ],
    );
  }
}
