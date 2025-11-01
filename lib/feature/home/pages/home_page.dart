import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:air_travel/feature/home/widgets/discount_container.dart';
import 'package:air_travel/feature/home/widgets/popular_place.dart';
import 'package:air_travel/feature/home/widgets/carousel_images.dart';
import 'package:air_travel/feature/home/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  final List<String> images = [
    AppIcons.image,
    AppIcons.image2,
    AppIcons.image,
    AppIcons.image2,
    AppIcons.image,
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppIconButton(
          icon: AppIcons.calendar,
          onPressed: () {
            context.go(Routes.sevimli);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              SearchRow(controller: controller),
              12.height,
              CarouselImages(images: images),
              Text('Mashxur Joylar', style: AppStyles.h5Bold).paddingOnly(left: 24),
              PopularPlace(images: images),
              DiscountContainer(images: images),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
