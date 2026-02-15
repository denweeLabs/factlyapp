import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/bloc/facts/fact_share_cubit.dart';
import 'package:denwee/presentation/bloc/subscriptions/user_subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef FactCaptureBuilder =
    Function(
      BuildContext context,
      FactCaptureArea? captureArea,
      bool isWatermark,
      GlobalKey factOverlayKey,
    );

class StoriesFactCapture extends StatelessWidget {
  const StoriesFactCapture({super.key, required this.builder});

  final FactCaptureBuilder builder;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: getIt<FactShareCubit>().factPageRepaintKey,
      child: BlocSelector<FactShareCubit, FactShareState, FactCaptureArea?>(
        selector: (state) => state.capturingArea.toNullable(),
        builder: (context, captureArea) {
          return BlocSelector<
            UserSubscriptionCubit,
            UserSubscriptionState,
            bool
          >(
            selector: (state) => state.isSubscribed,
            builder: (context, isSubscribed) {
              final isWatermark = captureArea != null && !isSubscribed;
              return builder(
                context,
                captureArea,
                isWatermark,
                getIt<FactShareCubit>().factOverlayRepaintKey,
              );
            },
          );
        },
      ),
    );
  }
}
