import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/packages/retrieve_picture_model.dart';
import '../../home/widgets/dots.dart';

class DetailPicture extends StatefulWidget {
  const DetailPicture({super.key, required this.pictures});

  final List<RetrievePictureModel> pictures;

  @override
  State<DetailPicture> createState() => _DetailPictureState();
}

class _DetailPictureState extends State<DetailPicture> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 311.h,
              viewportFraction: 1.0,
              autoPlay: true,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => setState(() => currentIndex = index),
            ),
            items: widget.pictures.map(
              (e) {
                return Image.network(
                  e.picture,
                  width: double.infinity,
                  height: 311.h,
                  fit: BoxFit.cover,
                );
              },
            ).toList(),
          ),
        ),
        Dots(
          imagesCount: widget.pictures.length,
          currentIndex: currentIndex,
          inactive: AppColors.white,
          backgroundColor: AppColors.white.withAlpha(120),
        ),
      ],
    ).paddingSymmetric(horizontal: 18.w);
  }
}
