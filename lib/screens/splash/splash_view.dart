import '../../helper/app_export.dart';

class SplashView extends StatelessWidget {
  // SlplashController _controller = Get.put(SlplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SlplashController>(
          init: SlplashController(),
          builder: (controller) {
            return Stack(
              children: [
                Image.asset('assets/images/background.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: double.infinity),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: UIhelper.paddingHelper(context,
                        top: 88, bottom: 0, right: 0, left: 0),
                    // child: Image.asset(
                    //   'assets/images/sksLogo.png',
                    //   width: getHorizontalSize(context, 166),
                    //   height: getVerticalSize(context, 118),
                    // ),
                    child: FadeTransition(
                      opacity: controller.animationController,
                      child: Image.asset(
                        ImageConstant.sksLogo,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
