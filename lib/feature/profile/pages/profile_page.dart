import 'package:air_travel/feature/common/widgets/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/routing/routes.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/icons.dart';
import '../../../core/utils/styles.dart';
import '../../common/widgets/custom_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  Future<void> pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => image = File(file.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profil',
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.circle),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.greyscale50,
                  radius: 45,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null ? const Icon(Icons.person, size: 45, color: AppColors.greyscale500) : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: pickImage,
                    child: SvgPicture.asset(
                      AppIcons.exclude,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Text('Muhammad Karimov', style: AppStyles.h4Bold),
                const SizedBox(height: 4),
                Text('+998 99 919 31 11', style: AppStyles.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _tile(AppIcons.profile, 'Profilni tahrirlash'),
          _tile(
            AppIcons.notifications,
            'Bildirishnoma',
            onTap: () => context.push(Routes.bildirishnoma),
          ),
          _tile(
            AppIcons.wallet,
            'To‘lovlar',
            onTap: () => context.push(Routes.tolovlar),
          ),
          _tile(
            AppIcons.shielddone,
            'Buyurtma tarixi',
            onTap: () => context.push(Routes.buyurtmalarTarixi),
          ),
          _tile(
            AppIcons.morecircle,
            'Ilova tili',
            trailing: 'Uzbek (Uz)',
            onTap: () => context.push(Routes.language),
          ),
          _tile(
            AppIcons.lock,
            'Maxfiylik Siyosati',
            onTap: () => context.push(Routes.maxfiylikSiyosati),
          ),
          _tile(AppIcons.infosquare, 'Call Markaz'),
          _tile(AppIcons.send, 'Ulashish', showArrow: false),
          ListTile(
            leading: SvgPicture.asset(AppIcons.logout),
            title: const Text(
              'Chiqish',
              style: TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tile(
    String svgPath,
    String title, {
    String? trailing,
    bool showArrow = true,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(svgPath, width: 22, height: 22),
      title: Text(title),
      trailing: trailing != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(trailing, style: AppStyles.bodyXlarge),
                if (showArrow) const SizedBox(width: 8),
                if (showArrow) const Icon(Icons.chevron_right, color: AppColors.greyscale900, size: 30),
              ],
            )
          : showArrow
          ? const Icon(Icons.chevron_right, color: AppColors.greyscale900, size: 30)
          : null,
    );
  }
}
