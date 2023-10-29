import 'package:sks/helper/app_export.dart';

class DefaultButtonWidget extends StatelessWidget {
  DefaultButtonWidget(
      {required this.buttonText,
      required this.onPressed,
      this.btnColor,
      this.textColor,
      this.isLoading = false});
  final String buttonText;
  final Function() onPressed;
  final Color? btnColor;
  final Color? textColor;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getVerticalSize(context, 58),
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: isLoading
                ? ColorConstant.gray400
                : btnColor ?? ColorConstant.lightGreen500,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(getSize(context, 11)),
            )),
        child: isLoading
            ? Center(
                child: SizedBox(
                height: getSize(context, 20),
                width: getSize(context, 20),
                child: CircularProgressIndicator(
                  color: ColorConstant.blue700,
                  strokeWidth: getSize(context, 3),
                ),
              ))
            : Text(
                buttonText,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.txtRobotoRomanBold16(context)
                    .copyWith(color: textColor ?? ColorConstant.whiteA700),
              ),
      ),
    );
  }
}
