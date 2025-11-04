import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = _getCurrentIndex(location);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.greyscale900,
      unselectedItemColor: AppColors.greyscale500,
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      elevation: 8,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go(Routes.home);
            break;
          case 1:
            context.go(Routes.profile);
            break;
          case 2:
            context.go(Routes.profile);
            break;
          case 3:
            context.go(Routes.sevimli);
            break;
          case 4:
            context.go(Routes.profile);
            break;
        }
      },
      items: [
        navigate2Page(icon: AppIcons.home, label: "Asosiy"),
        navigate2Page(icon: AppIcons.ticket, label: "Paketlar"),
        navigate2Page(icon: AppIcons.call2, label: "Aloqa"),
        navigate2Page(icon: AppIcons.heart, label: "Sevimlilar"),
        navigate2Page(icon: AppIcons.profile, label: "Profil"),
      ],
    );
  }

  int _getCurrentIndex(String location) {
    if (location.startsWith(Routes.home)) return 0;
    if (location.startsWith(Routes.profile)) return 1;
    if (location.startsWith(Routes.profile)) return 2;
    if (location.startsWith(Routes.sevimli)) return 3;
    if (location.startsWith(Routes.profile)) return 4;
    return 0;
  }

  BottomNavigationBarItem navigate2Page({required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon, width: 24.w, height: 24.h),
      activeIcon: SvgPicture.asset(
        icon,
        width: 24.w,
        height: 24.h,
        colorFilter: const ColorFilter.mode(AppColors.greyscale900, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
