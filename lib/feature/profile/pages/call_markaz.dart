import 'package:air_travel/feature/profile/pages/aloqa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/custom_app_bar.dart';

class CallMarkaz extends StatefulWidget {
  const CallMarkaz({super.key});

  @override
  State<CallMarkaz> createState() => _CallMarkazState();
}

class _CallMarkazState extends State<CallMarkaz>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> faqList = [
    {
      "question": "What is Funica?",
      "answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "question": "How to use Funica?",
      "answer":
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      "question": "Is Funica free to use?",
      "answer": "Yes, it’s completely free!",
    },
  ];

  final List<Map<String, String>> contactList = [
    {"icon": AppIcons.mikroPhone, "title": "Operator bilan bo’glanish"},
    {"icon": AppIcons.telegram, "title": "Telegram"},
    {"icon": AppIcons.webSite, "title": "Website"},
    {"icon": AppIcons.facebook, "title": "Facebook"},
    {"icon": AppIcons.instagram, "title": "Instagram"},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Call Markaz',
        showBackButton: true,
        centerTitle: false,
        textColor: AppColors.greyscale900,
        arrowColor: AppColors.greyscale900,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 4, color: AppColors.black),
              insets: EdgeInsets.symmetric(horizontal: 110),
            ),
            labelColor: AppColors.greyscale900,
            unselectedLabelColor: AppColors.black,
            labelStyle: AppStyles.bodyXlarge,
            tabs: const [
              Tab(text: "FAQ"),
              Tab(text: "Aloqa"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: ListView.builder(
                    itemCount: faqList.length,
                    itemBuilder: (context, index) {
                      final item = faqList[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.grey56,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: ExpansionTile(
                          shape: Border(),
                          dense: true,
                          tilePadding: EdgeInsets.symmetric(horizontal: 16.w),
                          title: Text(
                            item["question"]!,
                            style: AppStyles.h6Bold.copyWith(
                              color: AppColors.greyscale900,
                            ),
                          ),
                          trailing: SvgPicture.asset(
                            AppIcons.openclose,
                            height: 12.h,
                            width: 12.w,
                          ),
                          childrenPadding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            bottom: 10.h,
                          ),
                          children: [
                            Text(
                              item["answer"]!,
                              style: AppStyles.bodySmall.copyWith(
                                color: AppColors.greyscale700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contactList.length,
                      itemBuilder: (context, index) {
                        final item = contactList[index];
                        return Aloqa(item: item);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
