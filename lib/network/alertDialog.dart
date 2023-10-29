import '../helper/app_export.dart';

class AlertDialogCustom extends StatelessWidget {
  final String title;
  final String message;
  final bool isBack;

  AlertDialogCustom({
    required this.title,
    required this.message,
    this.isBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: 10,
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    context,
                    10,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: getHorizontalSize(
                        context,
                        20,
                      ),
                      top: getVerticalSize(
                        context,
                        20,
                      ),
                      right: getHorizontalSize(
                        context,
                        20,
                      ),
                      bottom: getVerticalSize(
                        context,
                        15,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(title,
                            style: AppStyle.txtRobotoRomanRegular14Black900(
                                    context)
                                .copyWith(
                              fontSize: getFontSize(context, 18),
                            )),
                        SizedBox(
                          height: getVerticalSize(
                            context,
                            15,
                          ),
                        ),
                        Text(message,
                            style: AppStyle.txtRobotoRomanRegular14Black900(
                                    context)
                                .copyWith(fontSize: getFontSize(context, 14))),
                        SizedBox(
                          height: getVerticalSize(
                            context,
                            10,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(getSize(context, 10)),
                            // backgroundColor: ColorConstant.teal500,
                          ),
                          onPressed: () {
                            if (isBack) {
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context,
                              //     AppRoutes.homeShopkeeperScreen,
                              //     (Route<dynamic> route) => false);
                              Get.offAll(() => LoginView());
                            } else {
                              Navigator.pop(context);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getHorizontalSize(context, 30)),
                            child: Text("OK",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtRobotoRomanBold16Black900(
                                        context)
                                    .copyWith(
                                        fontSize: getFontSize(context, 14),
                                        decoration: TextDecoration.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
