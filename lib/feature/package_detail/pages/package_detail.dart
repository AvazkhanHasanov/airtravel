import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/status.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/package_detail/managers/detail_bloc.dart';
import 'package:air_travel/feature/package_detail/managers/detail_state.dart';
import 'package:air_travel/feature/package_detail/widgets/day_by_day.dart';
import 'package:air_travel/feature/package_detail/widgets/detail_picture.dart';
import 'package:air_travel/feature/package_detail/widgets/title_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/widgets/for_destinations.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => DetailBloc(packageRepo: context.read())..add(GetDetailPackage(id: 1)),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state.detailStatus == Status.loading) {
              return Center(child: CircularProgressIndicator.adaptive());
            }
            if (state.detail == null) {
              return Center(child: CircularProgressIndicator.adaptive());
            }

            return SingleChildScrollView(
              child: Column(
                spacing: 4.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailPicture(pictures: state.detail!.pictures),
                  12.height,
                  TitleFeature(
                    title: state.detail!.title,
                    feature: state.detail!.coreFeatures,
                  ).paddingSymmetric(horizontal: 14),
                  Text('Sayohat tarkibi', style: AppStyles.h6Bold).paddingSymmetric(horizontal: 14),
                  Row(
                    spacing: 3.w,
                    children: [
                      ...List.generate(
                        state.detail!.destinations.length,
                        (index) => ForDestinations(
                          ccity: state.detail!.destinations[index].ccity,
                          duration: state.detail!.destinations[index].duration,
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 14.w),
                  Text('Sayohat kundaligi', style: AppStyles.h6Bold).paddingSymmetric(horizontal: 14),
                  6.height,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.h,
                      vertical: 12.w,
                    ),
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 552.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withAlpha(140),
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 47.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => 5.width,
                            itemCount: state.detail!.days.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => DayByDay(
                              dayNumber: state.detail!.days[index].dayNumber,
                              date: state.detail!.days[index].date,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 14.w),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
