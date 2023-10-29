import 'dart:convert';

import 'package:sks/helper/app_export.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  DashboardController dashboardController = Get.find<DashboardController>();

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  var obscurePassword = true.obs;
  var loading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.text = 'usman.saeed@codelabs.inc';
    passwordController.text = 'lbvfNilN';
    super.onInit();
  }

  void loginService() {
    loading.value = true;
    var parameters = {
      constEmail: emailController.text,
      constPassword: passwordController.text,
    };
    debugPrint("parameters $parameters");
    ApiProvider().postObject(url: ApiProvider.logIn, body: parameters).then(
        (onValue) async {
      var response = GeneralResponseModel<LoginResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        dashboardController.userInfo = response.result!;

        dashboardController.box
            .write(constSignInModel, json.encode(response.result!).toString());

        if (dashboardController.userInfo.info!.isPasswordForgot ?? false) {
          Get.offAll(() => ResetPasswordView());
        } else {
          Get.offAll(() => DashboardView());
        }
      } else {
        Get.dialog(AlertDialogCustom(
            title: 'Alert', message: '${response.response?.responseMessage}'));
      }
    }, onError: (error) {
      Get.dialog(AlertDialogCustom(title: 'title', message: '$error'));
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
