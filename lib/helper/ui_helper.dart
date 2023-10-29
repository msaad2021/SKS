// ignore_for_file: use_build_context_synchronously

import 'package:sks/helper/app_export.dart';

class UIhelper {
  static EdgeInsets paddingHelper(BuildContext context,
          {required double top,
          required double bottom,
          required double right,
          required double left}) =>
      EdgeInsets.only(
        top: getHorizontalSize(context, top),
        left: getVerticalSize(context, left),
        right: getVerticalSize(context, right),
        bottom: getHorizontalSize(context, bottom),
      );

  static snackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // backgroundColor: ColorConstant.red700,
      duration: const Duration(milliseconds: 500),
      content: Text(
        message,
      ),
    ));
  }

  static unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
