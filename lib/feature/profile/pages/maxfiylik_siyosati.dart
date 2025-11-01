import 'package:air_travel/core/context_extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/custom_app_bar.dart';

class MaxfiylikSiyosati extends StatefulWidget {
  const MaxfiylikSiyosati({super.key});

  @override
  State<MaxfiylikSiyosati> createState() => _MaxfiylikSiyosatiState();
}

class _MaxfiylikSiyosatiState extends State<MaxfiylikSiyosati> {
  final List<Map<String, String>> _policyList = [
    {
      "title": "1. Types of Data We Collect",
      "content":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    },
    {
      "title": "2. Use of Your Personal Data",
      "content":
      "Magna etiam tempor orci eu lobortis elementum nibh. Vulputate enim nulla aliquet porttitor lacus. Orci sagittis eu volutpat odio. Cras semper auctor neque vitae tempus quam pellentesque nec. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Commodo elit at imperdiet dui. Nisi vitae suscipit tellus mauris a diam. Erat pellentesque adipiscing commodo elit at imperdiet dui. Mi ipsum faucibus vitae aliquet nec ullamcorper. Pellentesque pulvinar pellentesque habitant morbi tristique senectus et."
    },
    {
      "title": "3. Disclosure of Your Personal Data",
      "content":
      "Consequat id porta nibh venenatis cras sed. Ipsum nunc aliquet bibendum enim facilisis gravida neque. Nibh tellus molestie nunc non blandit massa. Quam pellentesque nec nam aliquam sem et tortor consequat id. Faucibus vitae aliquet nec ullamcorper sit amet risus. Nunc consequat interdum varius sit amet. Eget magna fermentum iaculis eu non diam phasellus vestibulum. Pulvinar pellentesque habitant morbi tristique senectus et. Lorem donec massa sapien faucibus et molestie. Massa tempor nec feugiat nisl pretium fusce id. Lacinia at quis risus sed vulputate odio. Integer vitae justo eget magna fermentum iaculis. Eget gravida cum sociis natoque penatibus et magnis."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Maxfiylik Siyosati",
        showBackButton: true,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_policyList.length, (index) {
            final item = _policyList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["title"]!, style: AppStyles.h5Bold),
                  8.height,
                  Text(item["content"]!, style: AppStyles.bodyRegular),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
