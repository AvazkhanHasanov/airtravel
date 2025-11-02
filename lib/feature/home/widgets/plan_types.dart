import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/data/model/packages/feature_model.dart';
import 'package:air_travel/feature/home/widgets/discount.dart';
import 'package:air_travel/feature/home/widgets/down_arrow_buttun.dart';
import 'package:air_travel/feature/home/widgets/for_more_feature.dart';
import 'package:air_travel/feature/home/widgets/tarif_nomi.dart';
import 'package:air_travel/feature/home/widgets/travel_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanTypes extends StatefulWidget {
  const PlanTypes({
    super.key,
    required this.type,
    required this.price,
    required this.discountedPrice,
    required this.feature,
  });

  final String type;
  final int price;
  final int discountedPrice;
  final List<FeatureModel> feature;

  @override
  State<PlanTypes> createState() => _PlanTypesState();
}

class _PlanTypesState extends State<PlanTypes> {
  final List<String> feature = [
    'Transport Xizmati',
    'Nonushta ',
    'salomat',
    'salomat',
  ];

  final String text = 'bu tarifa siz ishoning men kafolat beraman ki  hali biror bir odam qilmagan ishalrni qildik ';
  bool isExpanded = false;
  final containerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = containerKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final height = renderBox.size.height;
        print('Haqiqiy container height: $height');
      }
    });

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        ClipRect(
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                width: 130.w,
                padding: EdgeInsets.only(top: 8.h, right: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.greyscale900,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.price}\$',
                              style: AppStyles.bodyLarge.copyWith(
                                color: AppColors.white,
                                height: 1,
                              ),
                            ),
                            Text(
                              'Afzalliklari',
                              style: AppStyles.h11Bold.copyWith(
                                color: AppColors.white,
                                fontSize: 7.sp,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${widget.discountedPrice}\$',
                          style: AppStyles.bodyLarge.copyWith(
                            color: AppColors.white.withAlpha(
                              (255 * 3 / 4).toInt(),
                            ),
                            fontSize: 9.sp,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 5.0,
                            decorationColor: AppColors.white.withAlpha(
                              (255 * 3 / 4).toInt(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          text,
                          style: AppStyles.h11Bold.copyWith(
                            color: AppColors.white,
                            height: 1,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    Wrap(
                      children: [
                        ...List.generate(
                          2,
                          (index) => TravelFeatures(title: feature[index]),
                        ),
                        feature.length > 2 ? ForMoreFeature(featureCount: feature.length - 2) : SizedBox.shrink(),
                      ],
                    ),
                    DownArrowButton(
                      onTap: () => setState(() => isExpanded = !isExpanded),
                    ),
                  ],
                ),
              ),
              Discount(),
            ],
          ),
        ),
        Positioned(top: -10, child: TarifNomi(title: widget.type)),
      ],
    );
  }
}
