import 'package:air_travel/data/repository/base_repository.dart';
import 'package:air_travel/data/repository/discounts_repository.dart';
import 'package:air_travel/data/repository/gallery_repository.dart';
import 'package:air_travel/data/repository/notification_repository.dart';
import 'package:air_travel/data/repository/order_create_repository.dart';
import 'package:air_travel/data/repository/order_list_repository.dart';
import 'package:air_travel/data/repository/package_repository.dart';
import 'package:air_travel/data/repository/popular_repository.dart';
import 'package:air_travel/feature/auth/managers/register_bloc.dart';
import 'package:air_travel/feature/home/managers/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repository/login_repository.dart';
import '../feature/auth/managers/login_bloc.dart';
import '../feature/auth/managers/otp_bloc.dart';
import '../feature/onboarding/managers/onboarding_cubit.dart';
import 'auth_interceptor.dart';
import 'client.dart';

final dependencies = <SingleChildWidget>[
  RepositoryProvider<FlutterSecureStorage>(create: (context) => FlutterSecureStorage()),
  RepositoryProvider<AuthInterceptor>(
    create: (context) => AuthInterceptor(secureStorage: context.read<FlutterSecureStorage>()),
  ),
  RepositoryProvider<ApiClient>(create: (context) => ApiClient(interceptor: context.read<AuthInterceptor>())),
  RepositoryProvider<GalleryRepository>(create: (context) => GalleryRepository(client: context.read<ApiClient>())),
  RepositoryProvider<LoginRepository>(
    create: (context) =>
        LoginRepository(client: context.read<ApiClient>(), storage: context.read<FlutterSecureStorage>()),
  ),
  RepositoryProvider(
    create: (context) =>
        LoginRepository(client: context.read<ApiClient>(), storage: context.read<FlutterSecureStorage>()),
  ),
  RepositoryProvider(create: (context) => BaseRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => DiscountsRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => NotificationRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => OrderRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => OrderListRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => PackageRepository(apiClient: context.read())),
  RepositoryProvider(create: (context) => PopularRepository(client: context.read())),
];

final blocDependencies = <SingleChildWidget>[
  BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit(galleryRepo: context.read<GalleryRepository>())),
  BlocProvider<LoginBloc>(create: (context) => LoginBloc(repository: context.read<LoginRepository>())),
  BlocProvider<OtpBloc>(create: (context) => OtpBloc(repository: context.read<LoginRepository>())),
  BlocProvider(create: (context) => RegisterBloc(repository: context.read<LoginRepository>())),
  BlocProvider(
    create: (context) => HomeBloc(popularRepo: context.read(), packageRepo: context.read())
      ..add(GetPopularPlace())
      ..add(GetPackages()),
  ),
];
