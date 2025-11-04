import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/status.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/home/managers/home_bloc.dart';
import 'package:air_travel/feature/home/managers/home_state.dart';
import 'package:air_travel/feature/home/widgets/carousel_images.dart';
import 'package:air_travel/feature/home/widgets/discount_container.dart';
import 'package:air_travel/feature/home/widgets/popular_place.dart';
import 'package:air_travel/feature/home/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.popularStatus == Status.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.h,
                children: [
                  SearchRow(controller: controller),
                  12.height,
                  CarouselImages(popular: state.popularPlace),
                  Text('Mashxur Joylar', style: AppStyles.h5Bold).paddingOnly(left: 24),
                  PopularPlace(popular: state.popularPlace),
                  DiscountContainer(images: images),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
