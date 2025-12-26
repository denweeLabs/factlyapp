// import 'package:denwee/core/ui/styles/text_styles.dart';
// import 'package:denwee/core/ui/theme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CommonBadge extends StatelessWidget {
//   const CommonBadge({super.key, required this.text, this.color});

//   final String text;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: color ?? context.darkPrimaryContainer,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4.0,
//             offset: const Offset(0.0, 3.0),
//           ),
//         ],
//       ),
//       child: _buildChild(context),
//     );
//   }

//   Widget _buildChild(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(7.w),
//       child: Text(text, style: bodyS.bold.copyWith(color: context.lightTextColor)),
//     );
//   }
// }
