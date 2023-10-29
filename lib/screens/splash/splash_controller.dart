import 'package:sks/helper/app_export.dart';
import 'package:sks/screens/dashboard/dashboard_view.dart';
import 'package:sks/screens/login/login_view.dart';

class SlplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  DashboardController dashboardController = Get.find<DashboardController>();
  int duration = 3;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    splashAnimation();
    _navigateToHome();

    // Get.off(() => LoginView());
  }

  void splashAnimation() {
    animationController = AnimationController(
      duration: Duration(seconds: duration),
      vsync: this,
    );
    animationController.forward();
  }

  _navigateToHome() async {
    Future.delayed(Duration(seconds: duration + 1), () async {
      // bool isForgetPass = CustomGlobals.userInfo.isForgotPassword ?? false;
      // if (value && !isForgetPass) {
      // Navigator.of(context).pushReplacementNamed(AppRoutes.tabBarPage);
      // } else {
      //   Navigator.of(context).pushReplacementNamed(AppRoutes.signInPage);
      // }
      if (!dashboardController.box.hasData(constSignInModel)) {
        Get.off(() => LoginView());
      } else {
        Get.off(() => DashboardView());
      }
    });
  }
}
