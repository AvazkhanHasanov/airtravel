import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/feature/onboarding/pages/onboarding_page.dart';
import 'package:air_travel/feature/onboarding/pages/welcome_page.dart';
import 'package:air_travel/feature/package_detail/pages/package_detail.dart';
import 'package:air_travel/feature/profile/pages/bildirishnoma.dart';
import 'package:air_travel/feature/profile/pages/buyurtmalar_tarixi.dart';
import 'package:air_travel/feature/profile/pages/call_markaz.dart';
import 'package:air_travel/feature/profile/pages/language.dart';
import 'package:air_travel/feature/profile/pages/maxfiylik_siyosati.dart';
import 'package:air_travel/feature/profile/pages/profile_page.dart';
import 'package:air_travel/feature/sevimli/pages/sevimli_page.dart';
import 'package:air_travel/feature/profile/pages/to%E2%80%99lovlar_tarixi.dart';
import 'package:air_travel/feature/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/pages/login_page.dart';
import '../../feature/home/pages/home_page.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => HomePage()),
    GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomePage()),
    GoRoute(path: Routes.onboarding, builder: (context, state) => OnboardingPage()),
    GoRoute(path: Routes.profile, builder: (context, state) => ProfilePage()),
    GoRoute(path: Routes.sevimli, builder: (context, state) => SevimliPage()),
    GoRoute(path: Routes.profile, builder: (context, state) => ProfilePage()),
    GoRoute(path: Routes.maxfiylikSiyosati, builder: (context, state) => MaxfiylikSiyosati()),
    GoRoute(path: Routes.language, builder: (context, state) => Language()),
    GoRoute(path: Routes.bildirishnoma, builder: (context, state) => Bildirishnoma()),
    GoRoute(path: Routes.tolovlar, builder: (context, state) => TolovlarTarixi()),
    GoRoute(path: Routes.buyurtmalarTarixi, builder: (context, state) => BuyurtmalarTarixi()),
    GoRoute(path: Routes.call, builder: (context, state) => CallMarkaz()),
    GoRoute(path: Routes.detailPackage, builder: (context, state) => PackageDetail()),
  ],
);
