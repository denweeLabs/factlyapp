import 'dart:io';

import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:denwee/core/network/domain/failure/common_api_failure.dart';
import 'package:denwee/core/profile/domain/failure/profile_failure.dart';
import 'package:denwee/core/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:denwee/core/ui/bloc/profile_cubit/profile_cubit.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:denwee/core/ui/router/root_router.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:denwee/core/ui/utils/dialogs_util.dart';
import 'package:denwee/core/ui/utils/haptic_util.dart';
import 'package:denwee/core/ui/utils/launcher_util.dart';
import 'package:denwee/core/ui/widget/animations/common_animations/common_animations.dart';
import 'package:denwee/core/ui/widget/animations/constants/animation_bipos.dart';
import 'package:denwee/core/ui/widget/buttons/app_solid_button_widget.dart';
import 'package:denwee/core/ui/widget/buttons/app_text_button_widget.dart';
import 'package:denwee/core/ui/widget/common/common_app_bar_widget.dart';
import 'package:denwee/core/ui/widget/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/core/ui/widget/common/common_loading_widget.dart';
import 'package:denwee/core/ui/widget/common/common_pop_scope_widget.dart';
import 'package:denwee/core/ui/widget/common/common_scaffold_widget.dart';
import 'package:denwee/core/ui/widget/misc/fading_edge_widget.dart';
import 'package:denwee/core/ui/widget/misc/onscreen_button_keyboard_dismisser_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:denwee/pages/account/profile/ui/cubit/edit_profile_cubit.dart';
import 'package:denwee/pages/account/profile/ui/widget/personal_details_card_widget.dart';
import 'package:denwee/pages/account/profile/ui/widget/profile_more_card_widget.dart';
import 'package:denwee/pages/account/profile/ui/widget/profile_save_changes_button_widget.dart';
import 'package:denwee/pages/account/profile/ui/widget/undercover_card_title_widget.dart';
import 'package:denwee/pages/account/ui/widget/subscription/subscription_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'ProfilePage';

  static const personalDetailsHeroTag = 'profile_personal_hero_tag';
  static const hPadding = 24;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profile =
          getIt<ProfileCubit>().state.profile.getOrElse(() => throw '');

      // display name in case it present
      if (profile.name.isSome()) {
        nameController.text = profile.name.getOrElse(() => throw '').value;
      }

      // display email
      emailController.text = profile.email.toNullable()!.value;
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  bool _listener(EditProfileState p, EditProfileState c) {
    if (p.isSaving && !c.isSaving && c.isSaveFailure) {
      AppDialogs.showErrorSnackbar(
        title: context.tr(LocaleKeys.label_oops),
        description: c.saveFailure.toNullable()!.errorMessage(context),
      );
    } else if (p.isAccountDeleting &&
        !c.isAccountDeleting &&
        c.isAccountDeleteFailure) {
      AppDialogs.showErrorSnackbar(
        title: context.tr(LocaleKeys.label_oops),
        description: c.accountDeleteFailure.toNullable()!.errorMessage(context),
      );
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (_, _) {},
      listenWhen: _listener,
      child: CommonPopScope(
        onWillPop: _onBack,
        child: CommonScaffold(
          overlappedWidget: _buildSaveButton(),
          iconPath: AppConstants.assets.icons.userLinear,
          body: OnscreenButtonKeyboardDismisser(
            customDismissAction: _unfocus,
            builder: (_, _, bottomInset) => CommonDismissOnTap(
              dismiss: _unfocus,
              child: Column(
                children: [
                  CommonAppBar(
                    onBack: _onBack,
                    backgroundColor: Colors.transparent,
                    title: context.tr(LocaleKeys.account_section_profile_title),
                  ),
                  Expanded(
                    child: FadingEdge(
                      axis: Axis.vertical,
                      enabled: Platform.isIOS,
                      child: Builder(builder: (context) {
                        final hasChanges = context.select<EditProfileCubit, bool>(
                                (cubit) => cubit.state.hasChanges);

                        final bottomPadding = _retrieveBottomPadding(
                          hasChanges,
                          bottomInset,
                        );

                        final listPadding = EdgeInsets.symmetric(horizontal: ProfilePage.hPadding.w)
                            .copyWith(
                          bottom: bottomPadding,
                          top: 24.h,
                        );

                        return ListView(
                          padding: listPadding,
                          children: [
                            _buildPersonalDetails(context).fadeSlide(
                              fades: const BiPos(0.0, 1.0),
                              offsets:
                                  const BiPos(Offset(0.0, 0.1), Offset.zero),
                              delay: const Duration(milliseconds: 200),
                            ),
                            34.verticalSpace,
                            _buildMoreSection(context).fadeSlide(
                              fades: const BiPos(0.0, 1.0),
                              offsets:
                                  const BiPos(Offset(0.0, 0.1), Offset.zero),
                              delay: const Duration(milliseconds: 400),
                            ),
                            58.verticalSpace,
                            _buildLogoutButton(context).fadeScale(
                              fades: const BiPos(0.0, 1.0),
                              scales: const BiPos(0.0, 1.0),
                              delay: const Duration(milliseconds: 600),
                            ),
                            24.verticalSpace,
                            _buildDeleteAccountButton(context).fade(
                              fades: const BiPos(0.0, 1.0),
                              delay: const Duration(milliseconds: 400),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      final isDeleting = context.select<EditProfileCubit, bool>(
          (cubit) => cubit.state.isAccountDeleting);

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: isDeleting
            ? SizedBox(
                height: 60.h,
                child: const CommonLoading(),
              )
            : AppTextButton(
                onTap: _onAccountDelete,
                text: context.tr(LocaleKeys.button_delete_account).toUpperCase(),
                textColor: context.textColor.withValues(alpha: 0.2),
              ),
      );
    });
  }

  Widget _buildLogoutButton(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.58,
      child: AppSolidButton(
        text: context.tr(LocaleKeys.button_logout),
        onTap: getIt<AuthCubit>().setUnauthenticated,
      ),
    );
  }

  Widget _buildMoreSection(BuildContext context) {
    return UndercoverCardTitle(
      title: context.tr(LocaleKeys.account_profile_more_title),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: ProfilePage.hPadding.w / 1.7,
        mainAxisSpacing: ProfilePage.hPadding.w / 1.7,
        padding: EdgeInsets.zero,
        childAspectRatio: 1.1,
        children: [
          ProfileMoreCard(
            icon: AppConstants.assets.icons.lockLinear,
            title: context.tr(LocaleKeys.account_profile_more_change_password),
            onTap: _onChangePassword,
          ),
          ProfileMoreCard(
            icon: AppConstants.assets.icons.messageQuestionLinear,
            title: context.tr(LocaleKeys.account_profile_more_contact_support),
            onTap: _onContactSupport,
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDetails(BuildContext context) {
    final borderRadius = BorderRadius.all(AppConstants.style.radius.card);
    final shape = RoundedSuperellipseBorder(borderRadius: borderRadius);
    
    return UndercoverCardTitle(
      title: context.tr(LocaleKeys.account_profile_personal_title),
      child: RepaintBoundary(
        child: DecoratedBox(
          decoration: ShapeDecoration(
            shape: shape,
            color: context.primaryContainer,
            shadows: [AppConstants.style.colors.commonShadow],
          ),
          child: Column(
            children: [
              BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                return PersonalDetailsCard(
                  // name
                  nameController: nameController,
                  nameFocusNode: nameFocusNode,
                  onNameChanged: context.read<EditProfileCubit>().onNameChanged,
                  nameInError: state.name
                      .fold(() => false, (name) => !name.isPure && name.isNotValid),
                  nameErrorMessage: state.name.toNullable()?.error?.errorName(context),
                  // email
                  emailController: emailController,
                  emailFocusNode: emailFocusNode,
                  onEmailChanged: context.read<EditProfileCubit>().onEmailChanged,
                  emailInError: !state.email.isPure && state.email.isNotValid,
                  emailErrorMessage: state.email.error?.errorName(context),
                  // misc
                  isFormValid: state.isValid,
                );
              }),
              const SubscriptionCard(onlyBody: true),
            ],
          ),
        ),
      ),
    );
  }

  // Align _buildAvatar() {
  //   return Align(
  //     alignment: Alignment.centerRight,
  // child: Heroine(
  //   tag: ProfilePage.avatarHeroTag,
  //   spring: Spring.bouncy,
  //   adjustToRouteTransitionDuration: true,
  //   flightShuttleBuilder: const SingleShuttleBuilder(),
  //       child: LargeAvatarCard(
  //         onTap: _onAvatarTap,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSaveButton() {
    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: 0.0,
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) => ProfileSaveChangesButton(
          isVisible: state.isSaveVisible,
          isSaving: state.isSaving,
          isSaveSuccess: state.isSaveSuccess,
          onTap: _onSave,
        ),
      ),
    );
  }

  double _retrieveBottomPadding(bool hasChanges, double bottomInset) {
    double result = context.bottomPadding + bottomInset + 64.h;
    if (hasChanges) {
      result += 58.h;
    }
    return result;
  }

  // void _onAvatarTap() {}

  void _onSave() {
    final state = context.read<EditProfileCubit>().state;
    if (state.isValid) {
      if (state.isSaving || state.isAccountDeleting) return;
      _unfocus();
      context.read<EditProfileCubit>().save();
    } else {
      HapticUtil.medium();
      context.read<EditProfileCubit>().validate(
            name: state.name.toNullable()?.value,
            email: state.email.value,
          );
    }
  }

  void _onAccountDelete() {
    final state = context.read<EditProfileCubit>().state;
    if (state.isSaving || state.isAccountDeleting) return;
    _unfocus();
    AppDialogs.showAccountDeleteConfirmationDialog(context).then((isDelete) {
      if (isDelete == true) {
        context.read<EditProfileCubit>().deleteAccount();
      }
    });
  }

  void _onChangePassword() {
    _unfocus();
    context.restorablePushNamedArgs(Routes.changePassword, rootNavigator: true);
  }

  void _onContactSupport() {
    _unfocus();
    LauncherUtil.launchSupportEmail(context);
  }

  void _onBack() {
    final state = context.read<EditProfileCubit>().state;
    if (state.isSaving || state.isAccountDeleting) return;
    Navigator.of(context).pop();
  }

  void _unfocus() {
    nameFocusNode.unfocus();
    emailFocusNode.unfocus();
  }
}
