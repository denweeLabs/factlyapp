import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/connectivity_cubit/connectivity_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/daily_facts_cubit.dart';
import 'package:denwee/core/ui/bloc/facts_cubit/facts_archive_cubit.dart';
import 'package:denwee/core/ui/bloc/notifications_cubit/notifications_cubit.dart';
import 'package:denwee/core/ui/bloc/permissions_cubit/permissions_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/bloc/routes_cubit/routes_cubit.dart';
import 'package:denwee/core/ui/bloc/user_preferences_cubit/user_preferences_cubit.dart';
import 'package:denwee/core/ui/bloc/user_statistics_cubit/user_statistics_cubit.dart';
import 'package:denwee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootBlocProviders extends StatelessWidget {
  const RootBlocProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ConnectivityCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<PermissionsCubit>()..forceCheckNotifications(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<NotificationsCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UserPreferencesCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<UserStatisticsCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DailyFactsCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<FactsArchiveCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<RoutesCubit>(),
        ),
      ],
      child: child,
    );
  }
}
