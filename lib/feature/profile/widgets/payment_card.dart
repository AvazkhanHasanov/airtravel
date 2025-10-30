import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCard extends StatelessWidget {
  final String admin;
  final String date;
  final String amount;
  final String status;

  const PaymentCard({
    super.key,
    required this.admin,
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F8F8), Color(0xFFEFEFEF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey16, width: 2),
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.wallet,
                height: 26,
                width: 26,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(admin, style: AppStyles.bodyLarge),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppStyles.bodySmall.copyWith(color: AppColors.greyscale500),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: AppStyles.bodyLarge),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    status,
                    style: AppStyles.bodySmall.copyWith(color: AppColors.greyscale500),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    AppIcons.arrowDown,
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
