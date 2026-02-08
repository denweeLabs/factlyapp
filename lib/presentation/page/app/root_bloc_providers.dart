import 'package:denwee/presentation/bloc/auth/auth_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/active_background_cubit.dart';
import 'package:denwee/presentation/bloc/backgrounds/available_backgrounds_cubit.dart';
import 'package:denwee/presentation/bloc/connectivity/connectivity_cubit.dart';
import 'package:denwee/presentation/bloc/facts/daily_facts_cubit.dart';
import 'package:denwee/presentation/bloc/facts/facts_archive_cubit.dart';
import 'package:denwee/presentation/bloc/notifications/notifications_cubit.dart';
import 'package:denwee/presentation/bloc/permissions/permissions_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/subscription_offerings_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:denwee/presentation/bloc/user_preferences/user_preferences_cubit.dart';
import 'package:denwee/presentation/bloc/user_statistics/user_statistics_cubit.dart';
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
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<SubscriptionOfferingsCubit>(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<UserSubscriptionCubit>(),
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
          create: (_) => getIt<AvailableBackgroundsCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<ActiveBackgroundCubit>(),
        ),
      ],
      child: child,
    );
  }
}
