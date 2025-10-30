import 'package:air_travel/core/utils/styles.dart';
import 'package:air_travel/feature/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class Bildirishnoma extends StatefulWidget {
  const Bildirishnoma({super.key});

  @override
  State<Bildirishnoma> createState() => _BildirishnomaState();
}

class _BildirishnomaState extends State<Bildirishnoma> {
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Bildirishnoma",
        centerTitle: false,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("General Notification", style: AppStyles.bodyXlarge),
            SizedBox(
              height: 24,
              width: 44,
              child: Switch(
                value: isNotificationOn,
                activeTrackColor: AppColors.black,
                onChanged: (value) {
                  setState(() => isNotificationOn = value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
