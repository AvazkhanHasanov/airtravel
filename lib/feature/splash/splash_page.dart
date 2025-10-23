import 'package:air_travel/core/context_extensions.dart';
import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/core/utils/icons.dart';
import 'package:air_travel/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  Future<bool> isRegistered() async {
    final storage = const FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    return token != null && token.isNotEmpty;
  }

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 4))..repeat();
    _navigate();
  }

  Future<void> _navigate() async {
    final isLoggedIn = await isRegistered();
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;
    context.go(isLoggedIn ? Routes.home : Routes.welcome);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.mainLogo),
              Text('AirTravels', style: AppStyles.h1Bold),
            ],
          ),
          Spacer(),
          RotationTransition(turns: controller, child: SvgPicture.asset(AppIcons.loading)),
          20.height,
        ],
      ),
    );
  }
}
