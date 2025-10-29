import 'package:air_travel/core/routing/routes.dart';
import 'package:air_travel/feature/onboarding/pages/onboarding_page.dart';
import 'package:air_travel/feature/onboarding/pages/welcome_page.dart';
import 'package:air_travel/feature/profile/pages/profile_page.dart';
import 'package:air_travel/feature/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import '../../feature/auth/pages/login_page.dart';
import '../../feature/home/pages/home_page.dart';


final router = GoRouter(
  initialLocation:Routes.profile,
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => HomePage()),
GoRoute(path: Routes.login, builder: (context, state) => LoginPage()),
    GoRoute(path: Routes.splash, builder: (context, state) => SplashPage()),
    GoRoute(path: Routes.welcome, builder: (context, state) => WelcomePage()),
    GoRoute(path: Routes.onboarding, builder: (context, state) => OnboardingPage()),
     GoRoute(path: Routes.profile, builder: (context,state) => ProfilePage()),
  ],
);
