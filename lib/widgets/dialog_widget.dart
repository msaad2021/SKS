import '../helper/app_export.dart';
import 'package:lottie/lottie.dart';

class DialogWidget extends StatelessWidget {
  final String dialogText;
  final String scondText;
  final String blueBtnText;
  final String greyBtnText;
  final Function() blueBtnfunc;
  final Function() greyBtnfunc;
  final String? emailText;

  const DialogWidget({
    super.key,
    required this.dialogText,
    required this.blueBtnText,
    this.greyBtnText = "",
    required this.blueBtnfunc,
    required this.greyBtnfunc,
    this.emailText,
    this.scondText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: UIhelper.paddingHelper(context,
            top: 0, bottom: 0, right: 19, left: 19),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: UIhelper.paddingHelper(context,
              top: 48, bottom: 25, right: 25, left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageConstant.dialogueSuccessLogo,
                fit: BoxFit.cover,
                width: getHorizontalSize(context, 95),
              ),
              // LottieBuilder.asset(
              //   ImageConstant.doneTask,
              //   repeat: false,
              //   height: getVerticalSize(context, 220),
              // ),
              SizedBox(
                height: getVerticalSize(context, 18),
              ),
              Text(
                dialogText,
                textAlign: TextAlign.center,
                style: AppStyle.txtRobotoRomanBold18(context),
              ),
              SizedBox(
                height: getVerticalSize(context, 12),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    scondText,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtRobotoRomanRegular16Black900(context),
                  ),
                  Text(
                    emailText ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    // style: AppStyle.txtSFProTextBold16(context).copyWith(
                    //   color: ColorConstant.gray800,
                    // ),
                  )
                ],
              ),
              SizedBox(
                height: getVerticalSize(context, 42),
              ),
              Row(
                children: [
                  Expanded(
                    child: greyBtnText != ""
                        ? DefaultButtonWidget(
                            btnColor: ColorConstant.gray50,
                            textColor: ColorConstant.gray600,
                            onPressed: greyBtnfunc,
                            buttonText: greyBtnText,
                          )
                        : Container(),
                  ),
                  SizedBox(
                    width: getHorizontalSize(context, 11),
                  ),
                  Expanded(
                    child: blueBtnText != ""
                        ? DefaultButtonWidget(
                            onPressed: blueBtnfunc,
                            buttonText: blueBtnText,
                          )
                        : Container(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
