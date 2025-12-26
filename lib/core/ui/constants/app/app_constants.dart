import 'package:denwee/core/misc/domain/entity/app_language.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/misc/domain/entity/theme_coloration.dart';
import 'package:denwee/core/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart';
import 'package:utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

part 'style_constants.dart';
part 'assets_constants.dart';
part 'config_constants.dart';

class AppConstants {
  const AppConstants._();

  static const style = _StyleConstants();
  static const assets = _AssetsConstants();
  static final config = _ConfigConstants();
}
