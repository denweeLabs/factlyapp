part of 'app_constants.dart';

class _AssetsConstants {
  const _AssetsConstants();

  final icons = const _IconsAssets();
  final images = const _ImagesAssets();
  final animations = const _AnimationsAssets();
}

class _IconsAssets {
  const _IconsAssets();

  static const _folderPath = 'assets/icons/';

  // Linear icons
  final homeLinear = '${_folderPath}home_linear.svg';
  final userLinear = '${_folderPath}user_linear.svg';
  final lockLinear = '${_folderPath}lock_linear.svg';
  final eyeLinear = '${_folderPath}eye_linear.svg';
  final eyeSlashLinear = '${_folderPath}eye_slash_linear.svg';
  final addLinear = '${_folderPath}add_linear.svg';
  final editBoxLinear = '${_folderPath}edit_box_linear.svg';
  final notificationsLinear = '${_folderPath}notification_linear.svg';
  final logoutLinear = '${_folderPath}logout_linear.svg';
  final globeLinear = '${_folderPath}globe_linear.svg';
  final brushLinear = '${_folderPath}brush_linear.svg';
  final infoLinear = '${_folderPath}info_linear.svg';
  final alertLinear = '${_folderPath}alert_linear.svg';
  final verifyLinear = '${_folderPath}verify_linear.svg';
  final refreshLinear = '${_folderPath}refresh_linear.svg';
  final refresh2Linear = '${_folderPath}refresh2_linear.svg';
  final checkmarkLinear = '${_folderPath}checkmark.svg';
  final clockLinear = '${_folderPath}clock_linear.svg';
  final cdLinear = '${_folderPath}cd_linear.svg';
  final mobileLinear = '${_folderPath}mobile_linear.svg';
  final galleryAddLinear = '${_folderPath}gallery_add_linear.svg';
  final smsLinear = '${_folderPath}sms_linear.svg';
  final messageQuestionLinear = '${_folderPath}message_question_linear.svg';
  final userSquareLinear = '${_folderPath}user_square_linear.svg';
  final trashLinear = '${_folderPath}trash_linear.svg';
  final archiveTickLinear = '${_folderPath}archive_tick_linear.svg';
  final settingsLinear = '${_folderPath}settings_linear.svg';
  final playLinear = '${_folderPath}play_linear.svg';
  final locationLinear = '${_folderPath}location_linear.svg';
  final hashtagLinear = '${_folderPath}hashtag_linear.svg';
  final noteLinear = '${_folderPath}note_linear.svg';
  final magicStarLinear = '${_folderPath}magic_star_linear.svg';
  final videoPlayLinear = '${_folderPath}video_play_linear.svg';
  final profileDeleteLinear = '${_folderPath}profile_delete_linear.svg';

  // Bold icons
  final archiveTickBold = '${_folderPath}archive_tick_bold.svg';
  final heartBold = '${_folderPath}heart_bold.svg';

  // Arrows & Cross
  final arrowLeftAndroid = '${_folderPath}arrow_left_android.svg';
  final arrowLeftIos = '${_folderPath}arrow_left_ios.svg';
  final arrowRightAndroid = '${_folderPath}arrow_right_android.svg';
  final arrowRightIos = '${_folderPath}arrow_right_ios.svg';
  final arrowUpIos = '${_folderPath}arrow_up_ios.svg';
  final crossLinear = '${_folderPath}cross_linear.svg';

  // Social
  final google = '${_folderPath}google_icon.svg';
  final apple = '${_folderPath}apple_icon.svg';
  final facebook = '${_folderPath}facebook_icon.svg';
}

class _ImagesAssets {
  const _ImagesAssets();

  static const _folderPath = 'assets/images/';

  String interest(int id) => '${_folderPath}interest_$id.jpg';
}

class _AnimationsAssets {
  const _AnimationsAssets();

  static const _folderPath = 'assets/animations/';

  final coin = '${_folderPath}coin.json';
  final fire = '${_folderPath}fire.json';
  final question = '${_folderPath}question.json';
  final heartHands = '${_folderPath}heart_hands.json';
  final seal = '${_folderPath}seal.json';
  final smilingStar = '${_folderPath}smiling_star.json';
  final swipeUp = '${_folderPath}swipe_up.json';
}
