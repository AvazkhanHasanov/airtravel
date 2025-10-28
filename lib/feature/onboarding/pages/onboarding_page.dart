import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/core/utils/colors.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/app_text_button.dart';
import 'package:air_travel/feature/onboarding/managers/onboarding_cubit.dart';
import 'package:air_travel/feature/onboarding/managers/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/status.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  int _totalPages = 0;

  // final int _totalPages = 3;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  List<Map<String, dynamic>> pages = [
    {'image': AppIcons.onboarding2Png, 'title': 'We provide high quality products just for you'},
    {'image': AppIcons.onboarding2Png, 'title': 'We provide high quality products just for you'},
    {'image': AppIcons.onboarding2Png, 'title': 'We provide high quality products just for you'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.gallery.isNotEmpty) {
            _totalPages = state.gallery.length;
          }
          return PageView.builder(
            controller: _pageController,
            //state.gallery.length
            itemCount: state.gallery.length,
            onPageChanged: (int page) => setState(() => _currentPage = page),
            itemBuilder: (context, index) => Stack(
              children: [
                Image.network(state.gallery[index].picture, width: 428.w, height: 926.h, fit: BoxFit.cover),
                // Image.asset(pages[index]['image'], width: 428.w, height: 926.h, fit: BoxFit.cover),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 428.w,
                    height: 400.h,
                    color: AppColors.white,
                    child: Column(
                      spacing: 40.h,
                      children: [
                        Text(
                          state.gallery[index].prompt,
                          // pages[index]['title'],
                          style: AppStyles.h2Bold.copyWith(height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: _totalPages == 0
          ? const SizedBox.shrink()
          : Container(
              height: 140.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              decoration: BoxDecoration(color: AppColors.white),
              child: Column(
                spacing: 30.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_totalPages, (index) {
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: _currentPage == index ? 32 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index ? AppColors.greyscale900 : AppColors.greyscale300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                  AppTextButton(
                    text: _currentPage != _totalPages - 1 ? 'Keyingi' : 'Boshlash',
                    onPressed: () {
                      if (_currentPage < _totalPages - 1) {
                        _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      } else {
                        context.go(Routes.login);
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
