import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/third_party_login_body.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:denwee/core/network/domain/entity/common_api_failure.dart';
import 'package:denwee/core/profile/domain/entity/profile_failure.dart';
import 'package:denwee/presentation/bloc/auth/auth_cubit.dart';
import 'package:denwee/presentation/bloc/profile/profile_cubit.dart';
import 'package:denwee/presentation/shared/constants/app/app_constants.dart';
import 'package:denwee/presentation/shared/router/root_router.dart';
import 'package:denwee/presentation/shared/theme/app_theme.dart';
import 'package:denwee/presentation/shared/utils/dialogs_util.dart';
import 'package:denwee/presentation/shared/utils/haptic_util.dart';
import 'package:denwee/presentation/shared/utils/launcher_util.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/elastic_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in.dart';
import 'package:denwee/presentation/widget/shared/animations/animate_do/fade_in_up.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_solid_button_widget.dart';
import 'package:denwee/presentation/widget/shared/buttons/app_text_button_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_app_bar_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_dismiss_ontap_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_loading_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_pop_scope_widget.dart';
import 'package:denwee/presentation/widget/shared/common/common_scaffold_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/onscreen_button_keyboard_dismisser_widget.dart';
import 'package:denwee/di/di.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:denwee/presentation/bloc/edit_profile/edit_profile_cubit.dart';
import 'package:denwee/presentation/widget/profile/personal_details_card_widget.dart';
import 'package:denwee/presentation/widget/profile/profile_more_card_widget.dart';
import 'package:denwee/presentation/widget/profile/profile_save_changes_button_widget.dart';
import 'package:denwee/presentation/widget/profile/undercover_card_title_widget.dart';
import 'package:denwee/presentation/widget/profile/subscription_card_widget.dart';
import 'package:denwee/presentation/widget/shared/misc/solid_fading_edge_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'ProfilePage';

  static const hPadding = 24;
  static final shape = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.all(AppConstants.style.radius.card),
  );

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  late final AppSupportedAuthProvider authProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initTextControllers();
    });
    initAuthProvider();
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

  void initTextControllers() {
    final profile = getIt<ProfileCubit>().state.profile.toNullable();
    final name = profile?.name.toNullable();
    final email = profile?.email.toNullable();

    if (name != null) nameController.text = name.value;
    if (email != null) emailController.text = email.value;
  }

  void initAuthProvider() {
    authProvider = getIt<ProfileCubit>().state.profile.fold(
      () => AppSupportedAuthProvider.email,
      (profile) => profile.authProvider,
    );
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
                    child:
                        BlocSelector<EditProfileCubit, EditProfileState, bool>(
                          selector: (state) => state.hasChanges,
                          builder: (context, hasChanges) {
                            final bottomPadding = _retrieveBottomPadding(
                              hasChanges,
                              bottomInset,
                            );
                            return _buildScrollableBody(
                              bottomPadding: bottomPadding,
                              hasChanges: hasChanges,
                            );
                          },
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

  Widget _buildScrollableBody({
    required double bottomPadding,
    required bool hasChanges,
  }) {
    final listPadding = EdgeInsets.fromLTRB(
      ProfilePage.hPadding.w,
      24.h,
      ProfilePage.hPadding.w,
      bottomPadding,
    );

    return SolidVerticalFadingEdge(
      size: const FadingEdges.bottom(120),
      backgroundColor: context.theme.colorScheme.background,
      child: ListView(
        padding: listPadding,
        children: [
          _buildPersonalDetails(context).autoFadeInUp(sequencePos: 1),
          34.verticalSpace,
          _buildMoreSection(context).autoFadeInUp(sequencePos: 2),
          58.verticalSpace,
          _buildLogoutButton(context, hasChanges).autoElasticIn(sequencePos: 4),
          24.verticalSpace,
          _buildDeleteAccountButton(context).autoFadeIn(sequencePos: 4),
        ],
      ),
    );
  }

  Widget _buildDeleteAccountButton(BuildContext context) {
    return BlocSelector<EditProfileCubit, EditProfileState, bool>(
      selector: (state) => state.isAccountDeleting,
      builder: (context, isAccountDeleting) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: isAccountDeleting
            ? SizedBox(height: 60.h, child: const CommonLoading())
            : AppTextButton(
                onTap: _onAccountDelete,
                text: context
                    .tr(LocaleKeys.button_delete_account)
                    .toUpperCase(),
                textColor: context.textColor.withValues(alpha: 0.2),
              ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context, bool hasChanges) {
    return FractionallySizedBox(
      widthFactor: 0.58,
      child: AppSolidButton(
        text: context.tr(LocaleKeys.button_logout),
        onTap: getIt<AuthCubit>().setUnauthenticated,
        backgroundColors: !hasChanges
            ? null
            : [context.darkPrimaryContainer, context.darkPrimaryContainer],
        hideShadow: hasChanges,
      ),
    );
  }

  Widget _buildMoreSection(BuildContext context) {
    return UndercoverCardTitle(
      title: context.tr(LocaleKeys.account_profile_more_title),
      child: SizedBox.fromSize(
        size: Size.fromHeight(148.h),
        child: Row(
          children: [
            Expanded(
              child: ProfileMoreCard(
                icon: AppConstants.assets.icons.lockLinear,
                title: context.tr(LocaleKeys.account_profile_more_change_password),
                onTap: _onChangePassword,
              ),
            ),
            14.horizontalSpace,
            Expanded(
              child: ProfileMoreCard(
                icon: AppConstants.assets.icons.messageQuestionLinear,
                title: context.tr(LocaleKeys.account_profile_more_contact_support),
                onTap: _onContactSupport,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalDetails(BuildContext context) {
    return UndercoverCardTitle(
      title: context.tr(LocaleKeys.account_profile_personal_title),
      child: RepaintBoundary(
        child: PhysicalShape(
          elevation: 6.0,
          color: context.primaryContainer,
          clipper: ShapeBorderClipper(shape: ProfilePage.shape),
          shadowColor: AppConstants.style.colors.commonShadow.color,
          child: Column(
            children: [
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return PersonalDetailsCard(
                    // name
                    nameController: nameController,
                    nameFocusNode: nameFocusNode,
                    onNameChanged: context.read<EditProfileCubit>().onNameChanged,
                    nameInError: state.name.fold(() => false, (name) => !name.isPure && name.isNotValid),
                    nameErrorMessage: state.name.toNullable()?.error?.errorName(context),
                    // email
                    emailController: emailController,
                    emailFocusNode: emailFocusNode,
                    onEmailChanged: context.read<EditProfileCubit>().onEmailChanged,
                    emailInError: !state.email.isPure && state.email.isNotValid,
                    emailErrorMessage: state.email.error?.errorName(context),
                    // misc
                    isFormValid: state.isValid,
                    authProvider: authProvider,
                  );
                },
              ),
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

  void _onSave() async {
    final state = context.read<EditProfileCubit>().state;

    // validate state
    if (!state.isValid) {
      HapticUtil.medium();
      return context.read<EditProfileCubit>().validate(
        name: state.name.toNullable()?.value,
        email: state.email.value,
      );
    }

    // prevent concurrent requests
    if (state.isSaving || state.isAccountDeleting) {
      return;
    }

    // unfocus text fields
    _unfocus();

    // show warning before changing email
    if (state.isEmailChanged) {
      final isOk = await AppDialogs.showEmailChangeWarningDialog(context);
      if (isOk != true) return;
    }

    // submit changes
    context.read<EditProfileCubit>().save();
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
