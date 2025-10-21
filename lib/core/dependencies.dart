
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_interceptor.dart';
import 'client.dart';

final dependencies = <SingleChildWidget>[
  RepositoryProvider(create: (context) => FlutterSecureStorage()),
  RepositoryProvider(create: (context) => AuthInterceptor(secureStorage: context.read())),
  RepositoryProvider(create: (context) => ApiClient(interceptor: context.read())),
];
final blocDependencies = <SingleChildWidget>[];
