import 'package:air_travel/feature/common/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class SevimliPage extends StatelessWidget {
  const SevimliPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sevimli')),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
