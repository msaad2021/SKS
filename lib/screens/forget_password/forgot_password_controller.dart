import 'package:sks/helper/app_export.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var loading = false.obs;

  List<FocusNode> focusNodes = [
    FocusNode(),
  ];

  @override
  void onInit() {
    emailController.text = 'usman.saeed@codelabs.inc';
    // TODO: implement onInit
    super.onInit();
  }

  void forgotPasswordService() {
    loading.value = true;
    var parameters = {
      constEmail: emailController.text,
    };
    debugPrint("parameters $parameters");
    ApiProvider()
        .postObject(url: ApiProvider.forgotPassword, body: parameters)
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
