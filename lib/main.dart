import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/dependencies.dart';
import 'core/routing/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_theme.dart';

void main() {
  runApp(AirTravel());
}

class AirTravel extends StatelessWidget {
  const AirTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: dependencies,
      child: MultiBlocProvider(
        providers: blocDependencies,
        child: ScreenUtilInit(
          designSize: Size(428, 926),
          builder: (context, child) => MaterialApp.router(
            theme: AppTheme().lightTheme,
            themeMode: ThemeMode.light,
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
