import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/feature/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/payment_card.dart';

class TolovlarTarixi extends StatelessWidget {
  const TolovlarTarixi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> payments = [
      {'admin': 'Admin', 'date': 'Dec 14, 2024 | 16:42 PM', 'amount': '\$400', 'status': 'Tasdiqlandi'},
      {'admin': 'Admin', 'date': 'Dec 12, 2024 | 09:27 AM', 'amount': '\$300', 'status': 'Tasdiqlandi'},
      {'admin': 'Admin', 'date': 'Nov 08, 2024 | 18:49 PM', 'amount': '\$450', 'status': 'Tasdiqlandi'},
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'To’lovlar Tarixi',
        centerTitle: false,
        showBackButton: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: SvgPicture.asset(
              AppIcons.search,
              width: 26,
              height: 26,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: payments.map((item) {
            return PaymentCard(
              admin: item['admin'],
              date: item['date'],
              amount: item['amount'],
              status: item['status'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
