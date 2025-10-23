import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          GestureDetector(
            onTap: () => context.go(Routes.onboarding),
            child: Text('Keyingisi', style: AppStyles.bodyXlarge.copyWith(color: AppColors.white)),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(AppIcons.onboarding2Png, fit: BoxFit.cover, width: 428.w, height: 926.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to 👋', style: AppStyles.h1Bold.copyWith(color: AppColors.white)),
                Text('AirTravels', style: AppStyles.black),
                Text(
                  'The best furniture e-commerce app of the century for your daily needs!',
                  style: AppStyles.bodyXlarge.copyWith(color: AppColors.white),
                ),
                60.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
