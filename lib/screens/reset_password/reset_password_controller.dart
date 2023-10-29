import 'package:sks/helper/app_export.dart';

class ResetPasswordController extends GetxController {
  DashboardController dashboardController = Get.find<DashboardController>();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var obscureNew = true.obs;
  var obscureConfirm = true.obs;
  var loading = false.obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void resetPassService() {
    loading.value = true;
    var parameters = {
      constUserID: dashboardController.userInfo.info!.userId,
      constPassword: confirmPassword.text,
    };
    debugPrint("parameters $parameters");
    ApiProvider()
        .postObject(url: ApiProvider.resetPassword, body: parameters)
        .then((onValue) async {
      var response = GeneralResponseModel<LoginResponseModel>.fromJson(onValue);

      print("response ${response.result}");

      if (response.response?.responseCode == 0) {
        Get.dialog(AlertDialogCustom(
          title: 'Success',
          message: '${response.response?.responseMessage}',
          isBack: true,
        ));
      } else {
        Get.dialog(AlertDialogCustom(
            title: 'Alert', message: '${response.response?.responseMessage}'));
      }
    }, onError: (error) {
      Get.dialog(AlertDialogCustom(title: 'Alert', message: '$error'));
    }).whenComplete(() {
      loading.value = false;
    });
  }
}
