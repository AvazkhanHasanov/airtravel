import 'package:air_travel/core/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/custom_app_bar.dart';
import '../../common/widgets/app_icon_button.dart';

class BuyurtmalarTarixi extends StatelessWidget {
  const BuyurtmalarTarixi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> orders = [
      {
        'title': 'Umra safari',
        'date': 'Okt 19, 2023 | 09:27 AM',
        'from': 'Toshkent',
        'to': 'Madina',
        'price': '1200\$',
        'people': '1 kishi uchun',
        'image': 'assets/image/offers/offers_1.jpg',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buyurtmalar Tarixi',
        centerTitle: false,
        showBackButton: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: SvgPicture.asset(
              AppIcons.search,
              width: 26,
              height: 26,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: orders.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      item['image']!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item['title']!,
                                style: AppStyles.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item['date']!,
                                style: AppStyles.bodySmall.copyWith(
                                  color: AppColors.greyscale500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Qayerdan',
                                    style: AppStyles.bodySmall.copyWith(
                                      color: AppColors.greyscale500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Qayerga',
                                    style: AppStyles.bodySmall.copyWith(
                                      color: AppColors.greyscale500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(item['from']!,
                                      style: AppStyles.bodySmall),
                                  const SizedBox(height: 4),
                                  Text(item['to']!,
                                      style: AppStyles.bodySmall),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item['price']!,
                                style: AppStyles.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                height: 19.h,
                                padding: EdgeInsets.only(
                                    left: 1, right: 3.w, top: 1.h, bottom: 1),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.green),
                                  borderRadius: BorderRadius.circular(11.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppIconButton(
                                      icon: AppIcons.odambek,
                                      size: Size(16.r, 16.r),
                                      width: 12.w,
                                      height: 12.h,
                                      backgroundColor: AppColors.green,
                                      foregroundColor: AppColors.white,
                                      borderColor: AppColors.green,
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      item['people']!,
                                      style: AppStyles.bodySmall.copyWith(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
